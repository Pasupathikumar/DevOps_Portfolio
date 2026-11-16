using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Net;
using System.Net.Mail;
using System.ComponentModel.DataAnnotations;

namespace PortfolioSite.Pages
{
    public class ContactModel : PageModel
    {
        [BindProperty]
        [Required]
        public string? Name { get; set; }

        [BindProperty]
        [Required, EmailAddress]
        public string? Email { get; set; }

        [BindProperty]
        [Required]
        public string? Message { get; set; }

        public string? StatusMessage { get; set; }

        public void OnPost()
        {
            if (!ModelState.IsValid)
            {
                StatusMessage = "Please fill all required fields correctly.";
                return;
            }

            try
            {
                var emailUser = Environment.GetEnvironmentVariable("EMAIL_USER");
                var emailPassword = Environment.GetEnvironmentVariable("EMAIL_PASSWORD");

                if (string.IsNullOrEmpty(emailUser) || string.IsNullOrEmpty(emailPassword))
                {
                    throw new Exception("Email configuration is missing in environment variables.");
                }

                var mail = new MailMessage
                {
                    From = new MailAddress(emailUser),
                    Subject = $"Portfolio Contact from {Name}",
                    Body = $"Sender Email: {Email}\n\nMessage:\n{Message}"
                };

                mail.To.Add(emailUser);
                mail.ReplyToList.Add(new MailAddress(Email!));

                var smtp = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new NetworkCredential(emailUser, emailPassword),
                    EnableSsl = true
                };

                smtp.Send(mail);

                StatusMessage = "Message sent successfully!";
            }
            catch (Exception ex)
            {
                StatusMessage = "Failed to send message. Please try again later.";
                // Optional: log ex.Message
            }
        }
    }
}
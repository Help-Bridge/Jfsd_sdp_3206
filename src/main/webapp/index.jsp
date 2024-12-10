<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Help Bridge</title>
  <link rel="stylesheet" href="istyles.css">
</head>
<body>
  <header >
    <nav class="navbar">
      <div class="logo">
        <img src="images/icon1.jpg" alt="Help Bridge Logo" style="height: 40px; margin-right: 10px; vertical-align: middle;">
        <a href="#home">HelpBridge</a>
      </div>
      <ul class="nav-links">
        <li><a href="#home">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#features">Features</a></li>
        <li><a href="#contact">Contact</a></li>
        <li class="dropdown">
          <a href="#" class="dropbtn">Login</a>
          <div class="dropdown-content">
            <a href="admin-login.jsp">Admin</a>
            <a href="donorlogin">Donor</a>
            <a href="recipientlogin1">Recipient</a>
            <a href="logisticlogin">Logistic</a>
          </div>
        </li>
        <li class="dropdown">
          <a href="#" class="dropbtn">Sign up</a>
          <div class="dropdown-content">
            <a href="pregdonor">Donor</a>
            <a href="pregrecipient">Recipient</a>
            <a href="preglogistic">Logistic</a>
          </div>
        </li>
        
      </ul>
    </nav>
  </header>

  <section id="home">
    <div class="hero">
      <h1>Welcome to HelpBridge</h1>
      <p>Join us in making a difference by donating essentials to those in need.</p>
      <a href="#features" class="cta-button">Explore Features</a>
    </div>
    <div class="image-scroll">
      <div class="image-container">
        <!-- Original Set -->
        <img src="images/donate1.jpg" alt="Donation Drive" class="scroll-image">
        <img src="images/donate2.jpg" alt="Community Support" class="scroll-image">
        <img src="images/donate3.jpg" alt="Volunteer Work" class="scroll-image">
        <img src="images/donate4.jpg" alt="Emergency Relief" class="scroll-image">
        <img src="images/donate5.jpg" alt="Food Distribution" class="scroll-image">
        
        <!-- Duplicate Set -->
        <img src="images/donate1.jpg" alt="Donation Drive" class="scroll-image">
        <img src="images/donate2.jpg" alt="Community Support" class="scroll-image">
        <img src="images/donate3.jpg" alt="Volunteer Work" class="scroll-image">
        <img src="images/donate4.jpg" alt="Emergency Relief" class="scroll-image">
        <img src="images/donate5.jpg" alt="Food Distribution" class="scroll-image">
      </div>
    </div>
    
    
  </section>
 
  <div class="description" id="about">
    <h2>About</h2>
    <div class="about-content">
      <div class="about-text">
        <p>
          HelpBridge is a donation management system designed to bridge the gap between donors and beneficiaries.
          Through this platform, we aim to facilitate the donation process and make it more transparent, effective, and impactful.
        </p>
        <p>
         Simple and user-friendly interface for both donors and administrators.
          Track the progress and impact of your contributions.
         Multiple donation categories including monetary aid, essentials, and more.
        </p>
        <p>Take the first step towards making a positive change in someone's life!</p>
      </div>
      <div class="about-image">
        <img src="images/donate1.jpg" alt="About Us">
      </div>
    </div>
  </div>
  
  
  <div class="donation-process" id="features">
    <h2>Features</h2>
    <p>HelpBridge streamlines the donation process with the following features:</p>
    <p>
    <strong> Donation Categories:</strong> <p>Choose from a variety of categories like food, clothing, medical supplies, or monetary aid.</p>
    <p>
   <strong> Custom Donation Forms:</strong> <p>Specify the type, quantity, and preferences for your donations with an easy-to-use form.</p>
  </p>
  <p>
    <strong>  Pickup/Drop-off Scheduling:</strong> <p>Schedule convenient times for donation drop-offs or pickups to suit your availability.</p></p>
  </p>
  <p>
    <strong> Recurring Donations:</strong> <p>Set up monthly or periodic contributions to support ongoing causes.</p></p>
    <p><strong> Progress Tracking:</strong><p>Monitor the status of your donations, from collection to delivery to beneficiaries.</p> </p>
    <p><strong> Emergency Campaigns:</strong><p> Contribute to urgent campaigns during natural disasters or crises to provide immediate relief.</p>
    </p>
    <p>
      Whether you're donating essentials or funds, our system ensures your contributions reach those who need them the most, efficiently and transparently.
    </p>
  </div>
  <div class="contact" id="contact">
    <h2>Contact</h2>
    <div class="contact-links">
      <a href="https://www.facebook.com/" target="_blank">Facebook</a>
      <a href="https://www.linkedin.com/" target="_blank">LinkedIn</a>
      <a href="https://www.instagram.com/" target="_blank">Instagram</a>
    </div>
  </div>
  

</body>
</html>

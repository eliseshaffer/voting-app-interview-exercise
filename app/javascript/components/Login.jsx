import React, { useState } from "react";

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [zipCode, setZipCode] = useState("");
  
  const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content');

  const handleSubmit = (e) => {
    // Remove e.preventDefault() to allow form to submit to Rails
    console.log("Login attempt:", { email, password, zipCode });
  };

  return (
    <div>
      <h1>Sign In To Vote</h1>
      <form method="post" action="/login" onSubmit={handleSubmit}>
        <input type="hidden" name="authenticity_token" value={csrfToken} />
        <div>
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
        </div>
        <div>
          <label htmlFor="password">Password:</label>
          <input
            type="password"
            id="password"
            name="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </div>
        <div>
          <label htmlFor="zipCode">Zip Code:</label>
          <input
            type="text"
            id="zipCode"
            name="zip_code"
            value={zipCode}
            onChange={(e) => setZipCode(e.target.value)}
            required
          />
        </div>
        <button type="submit">Login</button>
      </form>
    </div>
  );
};

export default Login;

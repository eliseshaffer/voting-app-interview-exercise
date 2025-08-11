import React from "react";

const ThankYou = ({ candidateName }) => {
  return (
    <div>
      <h1>Thank You for Voting!</h1>
      <p>Your vote has been successfully recorded.</p>
      <p><a href="/login">Sign Out</a></p>
    </div>
  );
};

export default ThankYou;

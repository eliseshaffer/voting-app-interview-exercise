import React, { useState } from "react";

const Vote = () => {
  const [candidateName, setCandidateName] = useState("");
  
  const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content');

  const handleSubmit = (e) => {
    console.log("Vote submission:", { candidateName });
  };

  return (
    <div>
      <h1>Cast Your Vote</h1>
      <form method="post" action="/votes" onSubmit={handleSubmit}>
        <input type="hidden" name="authenticity_token" value={csrfToken} />
        <div>
          <label htmlFor="candidateName">Or, add a new candidate:</label>
          <input
            type="text"
            id="candidateName"
            name="candidate_name"
            value={candidateName}
            onChange={(e) => setCandidateName(e.target.value)}
            placeholder="Enter candidate name"
            required
          />
        </div>
        <button type="submit"Vote</button>
      </form>
    </div>
  );
};

export default Vote;

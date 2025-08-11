import React, { useState } from "react";

const Vote = ({ candidates = [] }) => {
  const [selectedCandidate, setSelectedCandidate] = useState("");
  const [candidateName, setCandidateName] = useState("");
  
  const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content');

  const handleExistingCandidateSubmit = (e) => {
    console.log("Existing candidate vote:", { selectedCandidate });
  };

  const handleWriteInSubmit = (e) => {
    console.log("Write-in candidate vote:", { candidateName });
  };

  return (
    <div>
      <h1>Cast Your Vote</h1>
      
      {candidates.length > 0 && (
        <div>
          <h3>Select a candidate:</h3>
          <form method="post" action="/votes" onSubmit={handleExistingCandidateSubmit}>
            <input type="hidden" name="authenticity_token" value={csrfToken} />
            <input type="hidden" name="candidate_name" value={selectedCandidate} />
            
            {candidates.map((candidate, index) => (
              <div key={index}>
                <input
                  type="radio"
                  id={`candidate_${index}`}
                  name="existing_candidate"
                  value={candidate}
                  checked={selectedCandidate === candidate}
                  onChange={(e) => setSelectedCandidate(e.target.value)}
                  required
                />
                <label htmlFor={`candidate_${index}`}>{candidate}</label>
              </div>
            ))}
            <button type="submit" disabled={!selectedCandidate}>Vote</button>
          </form>
        </div>
      )}
      
      <div>
        <h3>Or, add a new candidate:</h3>
        <form method="post" action="/votes" onSubmit={handleWriteInSubmit}>
          <input type="hidden" name="authenticity_token" value={csrfToken} />
          <input type="hidden" name="candidate_name" value={candidateName} />
          
          <input
            type="text"
            id="candidateName"
            value={candidateName}
            onChange={(e) => setCandidateName(e.target.value)}
            placeholder="Enter candidate name"
            required
          />
          <button type="submit" disabled={!candidateName.trim()}>Vote</button>
        </form>
      </div>
    </div>
  );
};

export default Vote;

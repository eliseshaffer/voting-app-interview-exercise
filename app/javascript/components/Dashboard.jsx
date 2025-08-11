import React from "react";

const Dashboard = ({ votes = [] }) => {
  return (
    <div>
      <h1>Results</h1>
      
      {votes.length > 0 ? (
        <div>
          <h2>Candidates and Vote Counts</h2>
          <table>
            <thead>
              <tr>
                <th>Candidate</th>
                <th>Votes</th>
              </tr>
            </thead>
            <tbody>
              {votes
                .sort((a, b) => b.vote_count - a.vote_count)
                .map((vote, index) => (
                  <tr key={index}>
                    <td>{vote.candidate}</td>
                    <td>{vote.vote_count}</td>
                  </tr>
                ))}
            </tbody>
          </table>
        </div>
      ) : (
        <p>No votes have been cast yet.</p>
      )}
    </div>
  );
};

export default Dashboard;

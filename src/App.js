import React from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          CI-CD - EC2 Deploy
        </p>
        <h5>Por Vinicius Siqueira</h5>
        <a
          className="App-link"
          href="https://www.valcann.com.br/"
          target="_blank"
          rel="noopener noreferrer"
        >
          Valcann Cloud Inteligence
        </a>
      </header>
    </div>
  );
}

export default App;

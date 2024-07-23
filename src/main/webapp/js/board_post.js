// script.js

// Simulate login state
let isLoggedIn = false; // Change this to true to simulate a logged-in user

function updateContent() {
    const loggedOutContent = document.getElementById('loggedOutContent');
    const loggedInContent = document.getElementById('loggedInContent');
    
    if (isLoggedIn) {
        loggedOutContent.classList.add('hidden');
        loggedInContent.classList.remove('hidden');
    } else {
        loggedOutContent.classList.remove('hidden');
        loggedInContent.classList.add('hidden');
    }
}

function login() {
    isLoggedIn = true;
    updateContent();
}

function logout() {
    isLoggedIn = false;
    updateContent();
}

// Initialize content based on the current login state
document.addEventListener('DOMContentLoaded', updateContent);

// pages/bad-code.js
// ⚠️ This file is intentionally bad to fail SonarQube Quality Gate
import React from 'react';

const BadCode = () => {
    // Unused variable (code smell)
    let unusedVariable = 123;

    // Bug: assignment instead of comparison
    let x = 5;
    if (x = 10) {   // ❌ This is a bug (should be '===')
        console.log("This will always run!");
    }

    // Duplicate code (code smell)
    function duplicate1() { return "dup"; }
    function duplicate2() { return "dup"; }
    function duplicate3() { return "dup"; }

    return (
        <div>
            <h1>Bad Code Page</h1>
            <p>This page is intentionally full of issues to fail Quality Gate.</p>
        </div>
    );
}

export default BadCode;

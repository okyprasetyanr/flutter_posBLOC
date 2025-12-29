const functions = require("firebase-functions");

exports.hello = functions.https.onCall((data, context) => {
  return {
    message: "Halo dari Cloud Function 🚀",
  };
});

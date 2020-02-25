export default (req, res) => {
  res.status(200).json({
    quote: "Write tests, not too many, lalala",
    author: "Guillermo R"
  });
};

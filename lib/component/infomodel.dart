class infoData {
  String? urlImage;
  String? text;

  //let's create the constructor
  infoData(
    this.urlImage,
    this.text,
  );
  static List<infoData> infoNewsData = [
    infoData(
        'https://images.saymedia-content.com/.image/ar_16:9%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTc0OTY5NTk1MDU5MzE2MTY0/how-to-decide-if-a-pet-pig-is-right-for-you.jpg',
        "Nong Meen"),
    infoData('https://www.swremovals.com.au/wp-content/uploads/2018/01/dog.jpg',
        "Nong Dewwwwwwww"),
    infoData(
        'https://th.bing.com/th/id/R.26e1b8d36a2f573aa20b4ff3353a79db?rik=ffcdJ50wCLcTkQ&pid=ImgRaw&r=0',
        "Nong Taowwwyyy"),
  ];
}

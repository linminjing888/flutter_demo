class Novel {
  String bid;
  String bookname; // 图书名
  String introduction; // 描述
  String bookInfo;
  String chapterid;
  String topic;
  String topicFirst;
  int dateUpdated;
  String author;
  String authorName; // 作者
  String topClass;
  String state;
  String readCount;
  String praiseCount;
  String statName; // 写作状态
  String novelClass;
  String className; // 分类
  String size;
  String bookCover; // 图书封面
  String chapteridFirst;
  String chargeMode;
  String digest;
  String price;
  List<String> tag;
  String isNew;
  int discountNum;
  int quickPrice;
  String formats;
  int audiobookPlayCount;
  String chapterNum;
  bool isShortStory;
  String userid;
  int searchHeat;
  int numClick;
  String recommendNum;
  String firstCateId;
  String firstCateName;
  String reason;
  String isFree;
  String isHot;
  int smUptime;

  Novel(
      {this.bid,
      this.bookname,
      this.introduction,
      this.bookInfo,
      this.chapterid,
      this.topic,
      this.topicFirst,
      this.dateUpdated,
      this.author,
      this.authorName,
      this.topClass,
      this.state,
      this.readCount,
      this.praiseCount,
      this.statName,
      this.novelClass,
      this.className,
      this.size,
      this.bookCover,
      this.chapteridFirst,
      this.chargeMode,
      this.digest,
      this.price,
      this.tag,
      this.isNew,
      this.discountNum,
      this.quickPrice,
      this.formats,
      this.audiobookPlayCount,
      this.chapterNum,
      this.isShortStory,
      this.userid,
      this.searchHeat,
      this.numClick,
      this.recommendNum,
      this.firstCateId,
      this.firstCateName,
      this.reason,
      this.isFree,
      this.isHot,
      this.smUptime});

  Novel.fromJson(Map<String, dynamic> json) {
    bid = json['bid'];
    bookname = json['bookname'];
    introduction = json['introduction'];
    bookInfo = json['book_info'];
    chapterid = json['chapterid'];
    topic = json['topic'];
    topicFirst = json['topic_first'];
    dateUpdated = json['date_updated'];
    author = json['author'];
    authorName = json['author_name'];
    topClass = json['top_class'];
    state = json['state'];
    readCount = json['readCount'];
    praiseCount = json['praiseCount'];
    statName = json['stat_name'];
    novelClass = json['class'];
    className = json['class_name'];
    size = json['size'];
    bookCover = json['book_cover'];
    chapteridFirst = json['chapterid_first'];
    chargeMode = json['chargeMode'];
    digest = json['digest'];
    price = json['price'];
    tag = json['tag'].cast<String>();
    isNew = json['is_new'];
    discountNum = json['discountNum'];
    quickPrice = json['quick_price'];
    formats = json['formats'];
    audiobookPlayCount = json['audiobook_playCount'];
    chapterNum = json['chapterNum'];
    isShortStory = json['isShortStory'];
    userid = json['userid'];
    searchHeat = json['search_heat'];
    numClick = json['num_click'];
    recommendNum = json['recommend_num'];
    firstCateId = json['first_cate_id'];
    firstCateName = json['first_cate_name'];
    reason = json['reason'];
    isFree = json['is_free'];
    isHot = json['is_hot'];
    smUptime = json['smUptime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bid'] = this.bid;
    data['bookname'] = this.bookname;
    data['introduction'] = this.introduction;
    data['book_info'] = this.bookInfo;
    data['chapterid'] = this.chapterid;
    data['topic'] = this.topic;
    data['topic_first'] = this.topicFirst;
    data['date_updated'] = this.dateUpdated;
    data['author'] = this.author;
    data['author_name'] = this.authorName;
    data['top_class'] = this.topClass;
    data['state'] = this.state;
    data['readCount'] = this.readCount;
    data['praiseCount'] = this.praiseCount;
    data['stat_name'] = this.statName;
    data['class'] = this.novelClass;
    data['class_name'] = this.className;
    data['size'] = this.size;
    data['book_cover'] = this.bookCover;
    data['chapterid_first'] = this.chapteridFirst;
    data['chargeMode'] = this.chargeMode;
    data['digest'] = this.digest;
    data['price'] = this.price;
    data['tag'] = this.tag;
    data['is_new'] = this.isNew;
    data['discountNum'] = this.discountNum;
    data['quick_price'] = this.quickPrice;
    data['formats'] = this.formats;
    data['audiobook_playCount'] = this.audiobookPlayCount;
    data['chapterNum'] = this.chapterNum;
    data['isShortStory'] = this.isShortStory;
    data['userid'] = this.userid;
    data['search_heat'] = this.searchHeat;
    data['num_click'] = this.numClick;
    data['recommend_num'] = this.recommendNum;
    data['first_cate_id'] = this.firstCateId;
    data['first_cate_name'] = this.firstCateName;
    data['reason'] = this.reason;
    data['is_free'] = this.isFree;
    data['is_hot'] = this.isHot;
    data['smUptime'] = this.smUptime;
    return data;
  }
}

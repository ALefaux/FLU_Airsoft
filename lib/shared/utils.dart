class Utils {
  static setSearchParam(String param) {
    List<String> caseSearchList = [];
    String temp = "";
    for (int i = 0; i < param.length; i++) {
      temp = temp + param[i];
      caseSearchList.add(temp);
    }
    return caseSearchList;
  }
}

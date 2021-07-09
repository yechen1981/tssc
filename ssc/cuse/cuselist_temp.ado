*! 显示数据库中的所有数据集
cap prog drop cuselist_temp
prog define cuselist_temp
  di "【0】"
  di "----------------------------------------------------------------------"
  di "1.  000001.dta: 平安银行历史股票数据"
  di "【a】"
  di "----------------------------------------------------------------------"
  di "1.  amricancellmapdata.dta: 美国蜂窝地图各个省份的位置坐标"
  di "【c】"
  di "----------------------------------------------------------------------"
  di "1.  cellmapdata.dta: 中国蜂窝地图各个省份的位置坐标"
  di "1.  countycode.dta: 中国各省市区县编号(即身份证前六位号码)"
  di "2.  china_label.dta: 中国地图标签"
  di "3.  china_map.dta: 中国地图数据"
  di "4.  china_city_spatial_distance.dta: 中国地级地图数据集"
  di "5.  china_province_spatial_distance.dta: 中国省级地图数据集"
  di "6.  cjd1617.dta: 金融学16和17年成绩单"
  di "7.  cpi.dta: 中国CPI2008/1-2017/11"
  di "8.  countrysexratio.dta: knoema各国总人口性别比例数据"
  di "9.  ctbc2.dta: 中债国债2002-2017年国债到期收益率"
  di "10. cnstockholiday.dta: 上交所与深交所休市日期"
  di "11. cnstockincome.dta: 1989年-2017年所有上市公司的基本收入状况"
  di "12. china-covid19.dta: 中国新冠疫情数据（数据来源：https://github.com/canghailan/Wuhan-2019-nCoV）"
  di "----------------------------------------------------------------------"
  di "【d】"
  di "----------------------------------------------------------------------"
  di "1.  echarts_worldmap.dta: ECharts世界地图各国中英文名称对照"
  di "【g】"
  di "----------------------------------------------------------------------"
  di "1.  gdpjdlj.dta: 中国GDP季度累计2006/第一季度-2017/第三季度"
  di "2.  gini_prov.dta: 1995-2010中国各省份Gini系数"
  di "【h】"
  di "----------------------------------------------------------------------"
  di "1.  huaihe.dta: 2017年淮河供暖政策对人预期寿命的影响模仿数据集"
  di "2.  houseprice.dta: 中国百城房价数据集"
  di "----------------------------------------------------------------------"
  di "【j】"
  di "----------------------------------------------------------------------"
  di "1.  jdcourse2018a.dta: 2018年上半年暨南大学排课选课表"
  di "2.  jd2017zsjh.dta: 暨南大学2017年各省招生人数"
  di "----------------------------------------------------------------------"
  di "【l】"
  di "----------------------------------------------------------------------"
  di "1.  life_expentancy.dta: 2010年中国各省市自治区人口出生时预期寿命"
  di "【m】"
  di "----------------------------------------------------------------------"
  di "1.  moneysupply.dta: 2008/1-2017/11中国货币供应量M0M1M2"
  di "----------------------------------------------------------------------"
  di "【p】"
  di "----------------------------------------------------------------------"
  di "1.  pm10.dta: 2017年淮河供暖政策对人预期寿命影响的原始数据集"
  di "2.  population.dta: 2010年中国各区县人口"
  di "3.  population_prov.dta: 2002-2014年全国各省市年末人口"
  di "4.  pjw.dta: 分城市人口、就业与工资(1990-2016)"
  di "----------------------------------------------------------------------"
  di "【s】"
  di "----------------------------------------------------------------------"
  di "1.  station.dta: 中国所有火车站车站代码"
  di "2.  smoking.dta: 合成控制法的美国39个洲的香烟销售量数据集"
  di "2.  sexratio.dta: knoema各国总人口性别比例数据"
  di "----------------------------------------------------------------------"
  di "【t】"
  di "----------------------------------------------------------------------"
  di "1.  titanic.dta: 泰坦尼克号生存数据集"
  di "2.  tourism.dta: 旅游事业发展情况"
  di "----------------------------------------------------------------------"
  di "【w】"
  di "----------------------------------------------------------------------"
  di "1.  world-covid19.dta: 全球新冠疫情数据（数据来源：https://github.com/CSSEGISandData/COVID-19）"
  di "----------------------------------------------------------------------"
  di "【书籍数据集】"
  di "注意！如果你想调用的数据集的名字里含大写字母，你需要把它的首字母调成小写才能调用!"
  di "1. 《计量经济学及Stata应用》——陈强著"
  di "2. 《高级计量经济学及Stata应用》——陈强著"
  di "3. 《An Introduction to Stata Programming, Second Edition》——Christopher F. Baum著"
end
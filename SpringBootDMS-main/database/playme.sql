create table tb_user
(
    id        int auto_increment
        primary key,
    user_pwd  varchar(50) null,
    user_name varchar(50) null,
    gender    int         null comment '用户性别：女=0；男=1',
    email     varchar(50) null,
    room_id   int         null,
    user_type int         null comment '角色类型：学生=0；宿舍管理员=1；后勤中心=2'
)
    comment '用户信息表';


create table tb_bookkeeping
(
    id             int auto_increment
        primary key,
    room_id        int         null,
    user_id        int         null,
    bk_money       double      null,
    bk_type        int         null comment '账目的类型：支出=0；收入=1',
    classification int         null comment '分类：
1. 对于支出：水电网=0；餐饮=1；图书=2；游玩=3；电影=4；其它=5。
2. 对于收入：舍费=0；红包=1',
    remark         varchar(50) null,
    bk_time        datetime    null,
    balance        double      null
)
    comment '记账表';



create table tb_building
(
    id            int auto_increment
        primary key,
    building_name varchar(20) null comment '楼栋名',
    floor_num     int         null comment '楼层数',
    liver_gender  int         null comment '此栋楼居住学生性别：女生=0；男生=1',
    manager_id    int         null comment '管理员ID',
    manager_name  varchar(50) null comment '管理员姓名',
    constraint tb_building_tb_user_user_id_fk
        foreign key (manager_id) references tb_user (id)
);


create table tb_exchange
(
    id           int auto_increment
        primary key,
    stu_id       int          null,
    stu_name     varchar(50)  null,
    gender       int          null comment '学生性别：女生=0；男生=1',
    building_id  int          null,
    room_id      int          null,
    ex_reason    varchar(140) null,
    ex_intention varchar(50)  null,
    ex_date      datetime     null,
    ex_status    int          null comment '调换状态：审核中=0，通过=1，未通过=2'
);



create table tb_intention
(
    id           int auto_increment comment '学号'
        primary key,
    stu_name     varchar(50) null,
    gender       int         null comment '性别：女=0；男=1',
    late         int         null comment '是否晚睡：不晚睡=0；晚睡=1',
    noise        int         null comment '是否吵闹：不吵闹=0；吵闹=1',
    late_n_noise int         null comment '行为习惯及意向：不吵闹不晚睡=0；不吵闹晚睡=1；吵闹不晚睡=2；吵闹晚睡=3'
)
    comment '意向信息表';





create table tb_menu
(
    id        int auto_increment
        primary key,
    title     varchar(50)  null comment '标题',
    icon      varchar(50)  null comment '图标',
    href      varchar(100) null comment '链接',
    target    varchar(50)  null comment '目标',
    parent_id int          null,
    user_type int          null comment '菜单类型：学生=0，宿管=1，后勤=2'
)
    comment '功能菜单';



create table tb_notification
(
    id           int auto_increment
        primary key,
    user_id      int          null,
    noti_head    varchar(140) null,
    noti_content varchar(140) null,
    noti_range   int          null comment '通知范围：即宿舍楼编号',
    noti_type    int          null comment '通知类型：一般=0，重要=1',
    noti_date    datetime     null
);


create table tb_repair
(
    id          int auto_increment
        primary key,
    rep_item    varchar(50) null,
    description varchar(50) null,
    rep_date    datetime    null,
    stu_id      int         null,
    building_id int         null,
    room_id     int         null,
    rep_status  int         null comment '维修状态：等待维修=0；维修完成=1',
    rep_man     varchar(50) null
);


create table tb_room
(
    id            int    not null
        primary key,
    building_id   int    null,
    brand         int    null,
    floor         int    null,
    room_capacity int    null comment '房间容量：无人间=0；一人间=1；二人间=2；四人间=4；六人间=6',
    room_status   int    null comment '房间状态：空房间=0；未满=1；已满=2',
    room_type     int    null comment '房间类型：学生寝室=0；宿管寝室=1；后勤办公室=2；招待所=3；小卖部=4；杂物间=5',
    balance       double null comment '舍费余额',
    constraint tb_room_tb_building_id_fk
        foreign key (building_id) references tb_building (id)
);


create table tb_user_menu
(
    id        int auto_increment
        primary key,
    user_type int null,
    menu_id   int null
);



INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000002, '123M', '兰阿姨', 0, 'lan2003@dorman.com', 171003, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000003, '123M', '宋阿姨', 0, 'song2003@dorman.com', 175015, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000008, '123M', '杨大爷', 1, 'yang2003@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000011, '123M', '张阿姨', 0, 'zhang2005@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000018, '123M', '邓阿姨', 0, 'deng2008@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000023, '123M', '王阿姨', 0, 'wang2010@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000025, '123M', '林阿姨', 0, 'lin2012@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000027, '123M', '姜阿姨', 0, 'jiang2013@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10000034, '123M', '李大爷', 1, 'li2016@dorman.com', null, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (10002894, '123456', '李阿姨', 1, 'sherlooock@qq.com', 112033, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (19200002, '123A', 'Admin2', 0, 'test@test.test', 121029, 2);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20000000, '123A', '王山崎', 0, 'AppleStore', 175015, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20030143, '123A', 'Admin', 1, 'admin@dormitory.cn', 11005, 2);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20160811, '123456', '王山崎', 1, 'asgar0dia@qq.com', 171010, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20160812, '1234561', '邓阿姨', 0, 'fk_lymq@163.com', 11005, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20192202, '123456', '陈三三', 0, 'eva@gmail.com', 171010, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20192893, '123456', '陈浩宕', 0, 'lena@temp.com', 171010, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20192895, '123456', '江小天', 0, 'euria@gmail.com', 123009, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20200011, '123H', '何帆', 0, 'Hefan@Hefan.com', 171010, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20200012, '123456', 'Nymeria', 0, 'nymeria@qq.com', 171010, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20200035, '123S', 'Silk', 1, 'silk@onedrive.com', 171001, 1);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20200394, '123456', 'Silky', 1, 'real_silk@onedrive.com', 119290, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20215816, '123456', '徐淮南', 1, null, 11002, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20218964, '123456', '徐偃兵', 1, null, 11003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20219283, null, '李淳罡', 1, null, 11004, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20220291, null, '温华', 1, null, 141004, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20220304, '123456', '邓太阿', 1, null, 141004, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20222922, '123456', '洪洗象', 1, null, 141003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20228281, null, '吴六鼎', 1, null, 141003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20229213, '123455', 'Amen', 1, 'amen@qq.com', 71002, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20229383, null, '赵希抟', 1, null, 123009, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20229814, '123456', '徐北栀', 1, null, 141004, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20229815, '123456', 'lymq', 1, '201998273@qq.com', 122001, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239214, '123456', '周俞莹', 0, null, 21002, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239215, '123456', '赖展文', 0, null, 21002, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239216, '123456', '汪访云', 0, null, 21002, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239217, '123456', '赵轶丽', 0, null, 21002, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239218, '123456', '徐金枝', 0, null, 21003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239219, '123456', '崔素欣', 0, null, 21003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239220, '123456', '余婷婷', 0, null, 21003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239221, '123456', '范琴韵', 0, null, 21003, 0);
INSERT INTO tb_user (id, user_pwd, user_name, gender, email, room_id, user_type) VALUES (20239222, '123456', '夏静芙', 0, null, 21004, 0);



INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171010001, 171010, 20200011, 40, 0, 0, '桶装水', '2021-06-03 08:22:33', 80);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171010002, 171010, 20200011, 100, 1, 0, '舍费', '2021-06-02 08:22:42', 180);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011005, 171011, 20200015, 10, 0, 0, '桶装水', '2021-05-14 08:22:33', 40);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011006, 171010, 20192202, 85, 0, 0, '水电费', '2021-06-02 14:35:33', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011008, 171010, 20192893, 240.8, 0, 3, '旅游', '2021-06-02 14:35:42', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011009, 171010, 20192893, 225, 0, 1, '海底捞', '2021-06-01 14:50:18', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011010, 171010, 20200011, 308, 0, 1, '吃烤鸭', '2021-06-01 14:50:23', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011011, 171010, 20192893, 140, 0, 4, '买洗衣液', '2021-06-02 14:50:29', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011012, 171010, 20192893, 96.5, 0, 4, '拖把', '2021-06-01 14:50:35', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011013, 171010, 20192202, 199, 0, 5, '吃烧烤', '2021-06-01 14:50:44', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011014, 171010, 20192202, 223, 0, 5, '吃烤肉', '2021-06-02 21:19:13', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011015, 171010, 20192202, 128, 0, 0, null, '2021-03-01 16:55:17', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011016, 171010, 20192202, 38, 0, 1, null, '2021-03-04 16:55:33', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011018, 171010, 20192202, 35, 0, 3, null, '2021-03-04 16:55:40', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011019, 171010, 20192202, 129, 0, 4, null, '2021-03-04 16:55:44', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011020, 171010, 20192202, 49, 0, 5, null, '2021-03-04 16:55:47', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011021, 171010, 20192202, 180, 0, 0, null, '2021-04-01 16:55:51', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011022, 171010, 20200011, 384.5, 0, 1, null, '2021-04-05 18:46:47', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011024, 171010, 20200011, 92, 0, 3, null, '2021-04-04 18:47:03', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011025, 171010, 20200011, 270, 0, 4, null, '2021-04-04 18:47:08', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011026, 171010, 20200011, 39, 0, 5, null, '2021-04-04 18:48:33', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011027, 171010, 20200011, 82.3, 0, 0, null, '2021-05-04 18:48:40', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011028, 171010, 20200011, 94.3, 0, 1, null, '2021-05-04 18:48:44', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011030, 171010, 20200011, 157.8, 0, 3, null, '2021-05-04 18:48:54', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011031, 171010, 20200011, 28.5, 0, 4, null, '2021-05-04 18:49:01', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011032, 171010, 20200011, 130, 0, 5, null, '2021-05-04 18:49:07', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011049, 171010, 20200011, 40, 0, 2, '而已集', '2021-06-03 17:15:36', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011050, 171010, 20200011, 30, 0, 2, null, '2021-05-06 17:15:40', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011051, 171010, 20200011, 40, 0, 2, null, '2021-04-06 17:15:44', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011052, 171010, 20200011, 80, 0, 2, null, '2021-03-06 19:31:44', null);
INSERT INTO tb_bookkeeping (id, room_id, user_id, bk_money, bk_type, classification, remark, bk_time, balance) VALUES (171011056, 171010, 20200011, 1000, 1, 0, '红包🧧', '2021-06-01 15:51:47', null);




INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (1, '1号楼', 13, 1, 10000018, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (2, '2号楼', 8, 0, 10000008, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (3, '3号楼', 6, 1, 10000025, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (4, '4号楼', 6, 1, 20160812, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (5, '5号楼', 7, 1, 10000003, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (6, '6号楼', 6, 1, 10000023, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (7, '7号楼', 5, 0, 10000034, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (8, '8号楼', 6, 0, 10000034, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (9, '9号楼', 8, 1, 10000011, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (10, '10号楼', 6, 1, 10000025, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (11, '11号楼', 6, 1, null, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (12, '12号楼', 7, 1, null, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (13, '13号楼', 6, 0, null, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (14, '14号楼', 4, 1, 10000008, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (15, '15号楼', 10, 0, null, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (16, '16号楼', 7, 0, 10000002, null);
INSERT INTO tb_building (id, building_name, floor_num, liver_gender, manager_id, manager_name) VALUES (17, '17号楼', 8, 0, 20200035, null);





INSERT INTO tb_exchange (id, stu_id, stu_name, gender, building_id, room_id, ex_reason, ex_intention, ex_date, ex_status) VALUES (1092834, 20200011, '何帆', 0, 17, 171010, '离教学楼太远', '希望能换到14栋', '2022-11-10 10:06:09', 2);
INSERT INTO tb_exchange (id, stu_id, stu_name, gender, building_id, room_id, ex_reason, ex_intention, ex_date, ex_status) VALUES (1092835, 20192895, '江小天', 0, 12, 123009, '楼层太低，阳光被挡', '可否换到3楼以上', '2022-11-10 10:06:15', 1);
INSERT INTO tb_exchange (id, stu_id, stu_name, gender, building_id, room_id, ex_reason, ex_intention, ex_date, ex_status) VALUES (1092841, 20200011, '何帆', 0, 17, 171010, '宿舍太吵', '换到1人间', '2022-11-10 10:08:40', 0);
INSERT INTO tb_exchange (id, stu_id, stu_name, gender, building_id, room_id, ex_reason, ex_intention, ex_date, ex_status) VALUES (1092844, 20200011, '何帆', 0, 17, 171010, '楼层太高！', '希望换到1楼或2楼', '2022-11-10 20:32:50', 0);




INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1011, '个人信息', null, 'student/info.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1021, '通知公告', null, 'notificationstu/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1031, '调换申请', null, 'exchangestu/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1032, '维修申请', null, 'repairstu/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1051, '记账管理', null, 'bookkeeping/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1111, '通知发布', null, 'notification/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1131, '维修处理', null, 'repair/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1211, '用户管理', null, 'user/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1221, '调换审核', null, 'exchange/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1231, '楼宇管理', null, 'building/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1232, '房间管理', null, 'room/list.html', null, 0, null);
INSERT INTO tb_menu (id, title, icon, href, target, parent_id, user_type) VALUES (1241, '宿舍分配', null, 'intention/arrange.html', null, 0, null);





INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293401, 20200035, '后天下午停电', '后天（11月14日）下午3:00~5:00，17栋停电', 17, 1, '2022-11-12 11:49:17');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293402, 20200035, '大功率电器检查', '11月12日~11月13日随机抽查大功率电器使用情况', 17, 0, '2022-11-10 11:53:00');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293403, 20200035, '明日特大暴雨⛈', '明天白天有特大暴雨，请尽量待在宿舍，避免外出!!!', 17, 1, '2022-11-9 12:34:09');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293407, 20200035, '失物招领', '遗失一张尾号为2093的校园卡的同学请到17栋1001取回丢失的卡片', 17, 0, '2022-11-8 12:54:31');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293410, 20200011, '下午开班会', '下午2:00~2:50在东三209开班会', 0, 0, '2022-11-10 08:19:54');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293411, 20192202, '帮忙带份午饭吧', '一份黄焖鸡米饭，不加辣椒。跑路费20块', 0, 0, '2022-11-10 08:21:09');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293412, 20192893, '下周二考试', '明早开始在图书馆集合', 0, 1, '2022-11-9 08:22:51');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293413, 20192895, '本周卫生安排', '周一：江小天；周二：何帆', 0, 0, '2021-11-9 08:25:01');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293414, 20229383, '水电缴费', '总计28.5元', 0, 0, '2021-06-02 08:32:51');
INSERT INTO tb_notification (id, user_id, noti_head, noti_content, noti_range, noti_type, noti_date) VALUES (180293427, 20200035, '宽带提速', '7月1日起，所有房间宽带免费升级至千兆。届时下载速度峰值将会提升至130Mb/s', 17, 0, '2022-06-01 10:10:20');





INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200302, '椅子', '椅子的腿折断了', '2021-02-11 10:07:05', 20229815, 12, 122001, 1, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200303, '插座', '宿舍门左侧的插座不通电', '2021-02-16 09:45:17', 20200394, 14, 142023, 1, '张师傅');
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200305, '水龙头', '阳台水龙头不能完全拧紧', '2021-03-10 11:07:53', 20200011, 17, 171010, 1, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200306, '门', '刚搬进来就是坏的', '2021-03-13 10:06:57', 20192895, 12, 123009, 1, '黄诗扶');
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200307, '门锁', '周围寝室的钥匙都能打开我们寝室的门', '2021-03-15 13:24:09', 20160811, 11, 115001, 0, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200308, '风扇', '风扇不能转动了', '2021-03-22 11:01:03', 20192893, 17, 171010, 2, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200312, '厕所镜子', '厕所镜子裂开了', '2021-04-01 13:24:06', 20192202, 17, 171010, 0, null);
INSERT INTO tb_repair (id, rep_item, description, rep_date, stu_id, building_id, room_id, rep_status, rep_man) VALUES (10200317, '厕所水管', '水管裂了', '2021-04-20 13:15:23', 20200011, 17, 171010, 1, null);



INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11001, 1, 1001, 1, 4, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11002, 1, 1002, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11003, 1, 1003, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11004, 1, 1004, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11005, 1, 1005, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11006, 1, 1006, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11007, 1, 1007, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11008, 1, 1008, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11009, 1, 1009, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (11010, 1, 1010, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12001, 1, 2001, 2, 4, null, 2, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12002, 1, 2002, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12003, 1, 2003, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12004, 1, 2004, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12005, 1, 2005, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12006, 1, 2006, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12007, 1, 2007, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12008, 1, 2008, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12009, 1, 2009, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (12010, 1, 2010, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (13001, 1, 3001, 3, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (13002, 1, 3002, 3, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (13003, 1, 3003, 3, 8, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21001, 2, 1001, 1, 4, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21002, 2, 1002, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21003, 2, 1003, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21004, 2, 1004, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21005, 2, 1005, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21006, 2, 1006, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21007, 2, 1007, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21008, 2, 1008, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21009, 2, 1009, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (21010, 2, 1010, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22001, 2, 2001, 2, 4, null, 2, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22002, 2, 2002, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22003, 2, 2003, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22004, 2, 2004, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22005, 2, 2005, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22006, 2, 2006, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22007, 2, 2007, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22008, 2, 2008, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22009, 2, 2009, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (22010, 2, 2010, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (23001, 2, 3001, 3, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (23002, 2, 3002, 3, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (23003, 2, 3003, 3, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (24001, 2, 4001, 4, 4, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (25011, 2, 5011, 5, 6, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (31001, 3, 1001, 1, 2, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (32001, 3, 2001, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (41001, 4, 1001, 1, 1, null, 2, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (42001, 4, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (51001, 5, 1001, 1, 2, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (52001, 5, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (52002, 5, 2002, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (52004, 5, 2004, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (52006, 5, 2006, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (61001, 6, 1001, 1, 2, null, 2, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (62001, 6, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (71001, 7, 1001, 1, 1, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (71002, 7, 1002, 1, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (72001, 7, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (81001, 8, 1001, 1, 1, null, 4, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (82001, 8, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (91001, 9, 1001, 1, 1, null, 3, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (92001, 9, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (92002, 9, 2002, 2, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (101001, 10, 1001, 1, 2, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (102001, 10, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (111001, 11, 1001, 1, 1, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (112001, 11, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (115001, 11, 5001, 5, 6, 1, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (121001, 12, 1001, 1, 1, null, 2, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (122001, 12, 2001, 2, 2, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (123009, 12, 3009, 3, 4, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (131001, 13, 1001, 1, 2, null, 3, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (132001, 13, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (132002, 13, 2002, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (141001, 14, 1001, 1, 1, 1, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (141002, 14, 1002, 1, 2, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (141003, 14, 1003, 1, 2, 0, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (141004, 14, 1004, 1, 6, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (142023, 14, 2023, 2, 4, 1, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (151001, 15, 1001, 1, 1, null, 4, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (152001, 15, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (161001, 16, 1001, 1, 1, 2, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (161002, 16, 1002, 1, 2, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (171001, 17, 1001, 1, 7, 2, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (171002, 17, 1002, 1, 1, null, 4, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (171003, 17, 1003, 1, 1, null, 1, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (171009, 17, 1009, 1, 4, 1, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (171010, 17, 1010, 1, 5, 2, 0, 2905);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (172001, 17, 2001, 2, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (173001, 17, 3001, 3, 6, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (173003, 17, 3003, 3, 4, null, 0, null);
INSERT INTO tb_room (id, building_id, brand, floor, room_capacity, room_status, room_type, balance) VALUES (173009, 17, 3009, 3, 2, null, 4, null);


INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (1, 0, 1011);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (3, 0, 1021);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (5, 0, 1031);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (6, 0, 1032);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (8, 0, 1041);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (9, 0, 1051);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (10, 1, 1111);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (11, 1, 1121);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (12, 1, 1131);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (14, 2, 1211);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (15, 2, 1221);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (17, 2, 1231);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (19, 2, 1232);
INSERT INTO tb_user_menu (id, user_type, menu_id) VALUES (20, 2, 1241);


DROP TABLE IF EXISTS `orderer_orgs`;
CREATE TABLE orderer_orgs
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  channel VARCHAR(256) NOT NULL comment '通道ID',
  org_id VARCHAR(256) comment '组织id',
  org_name VARCHAR(256) comment '组织名' 
)engine=innodb default charset=utf8 comment='orderer组织表';
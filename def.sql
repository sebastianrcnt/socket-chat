PRAGMA foregin_keys = 1;
CREATE TABLE IF NOT EXISTS `USER` (
    `EMAIL` VARCHAR PRIMARY KEY,
    `PASSWORD` VARCHAR NOT NULL,
    `NAME` VARCHAR NOT NULL
);
CREATE TABLE IF NOT EXISTS `CHATROOM` (
    `ID` VARCHAR PRIMARY KEY,
    `MAX_PARTICIPANTS` INTEGER NOT NULL DEFAULT 5
);
CREATE TABLE IF NOT EXISTS `CHAT` (
    ID VARCHAR PRIMARY KEY,
    CHATROOM_ID VARCHAR NOT NULL,
    USER_EMAIL VARCHAR NOT NULL,
    SENT_AT INTEGER NOT NULL DEFAULT 0,
    CONTENT TEXT NOT NULL DEFAULT `X`,
    CONSTRAINT `FK_CHAT_CHATROOM` FOREIGN KEY (`CHATROOM_ID`) REFERENCES `CHATROOM`(`ID`),
    CONSTRAINT `FK_CHAT_USER` FOREIGN KEY (`USER_EMAIL`) REFERENCES `USER`(`EMAIL`)
);
CREATE TABLE IF NOT EXISTS PARTICIPATION (
    CHATROOM_ID VARCHAR NOT NULL,
    USER_EMAIL VARCHAR NOT NULL,
    JOINED_AT INTEGER NOT NULL,
    EXITED INTEGER NOT NULL DEFAULT 0,
    -- EXITED: 1 NOT EXITED: 0
    EXITED_AT INTEGER,
    PRIMARY KEY (CHATROOM_ID, USER_EMAIL)
);
DELETE FROM `USER`;
DELETE FROM `CHATROOM`;
DELETE FROM `CHAT`;
DELETE FROM `PARTICIPATION`;
-- INSERTS
INSERT INTO USER (`EMAIL`, `PASSWORD`, `NAME`)
VALUES ('sebastianrcnt@gmail.com', 'secret', '정시원'),
    ('baenavly@naver.com', 'secret',  '배나연'),
    ('hwangstar@naver.com', 'secret', '황남일');
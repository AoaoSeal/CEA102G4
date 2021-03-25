package com.websocket;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.Session;



public class OneThread extends Thread {



    private Session session;

    private List<AlarmMessage> currentMessage;

    private DBUtil dbUtil;

    private int currentIndex;



    public OneThread(Session session,String bid_no) {

        this.session = session;

        currentMessage = new ArrayList<AlarmMessage>();

        dbUtil = new DBUtil();
        try {
			dbUtil.getFromDB(bid_no);
			System.out.println("OneThread="+dbUtil.getFromDB(bid_no));
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        currentIndex = 0;//此时是0条消息

    }



    public void run(String bid_no) {

        while (true) {

            List<AlarmMessage> list = null;

            try {

                try {

                    list = dbUtil.getFromDB(bid_no);

                } catch (ClassNotFoundException e) {

                    e.printStackTrace();

                } catch (IllegalAccessException e) {

                    e.printStackTrace();

                } catch (InstantiationException e) {

                    e.printStackTrace();

                }

            } catch (SQLException e) {

                e.printStackTrace();

            }

            if (list != null && currentIndex < list.size()) {

                for (int i = currentIndex; i < list.size(); i++) {

                    try {

                        session.getBasicRemote().sendText(list.get(i).getBid_no()

                                + "," + list.get(i).getBid_price()

                                + "," + list.get(i).getBid_time()+ "," + list.get(i).getMem_id());

//                            session.getBasicRemote().sendObject(list.get(i)); //No encoder specified for object of class [class AlarmMessage]

                    } catch (IOException e) {

                        e.printStackTrace();

                    }

                }

                currentIndex = list.size();
            }
            try {

                //一秒刷新一次

                Thread.sleep(1000);

            } catch (InterruptedException e) {

                e.printStackTrace();

            }



        }

    }

}
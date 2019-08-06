package aca.reply.model;

public interface ReplyDAO {
	public int reply_write(ReplyDTO rdto);
	public ReplyDTO reply_select(int q_idx);
	public int reply_delete(int q_idx);
}

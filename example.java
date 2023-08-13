public class PaymentDao {

  private static final Logger logger = LoggerFactory.getLogger(PaymentDao.class);
  
  private final Session session;
  
  public PaymentDao(Session session) {
      this.session = session;
  }
  
  /**
   * Persists the payment in the database.
   *
   * @param payment payment to save
   * @throws IllegalArgumentException if payment is null
   */
  public void save(Payment payment) {
        if (payment == null) {
            throw new IllegalArgumentException("Payment cannot be null");
        }
        try {
            session.beginTransaction();
            session.save(payment);
            session.getTransaction().commit();
        } catch (Exception e) {
            logger.error("Error while persisting payment", e);
            session.getTransaction().rollback();
        }
    }
  
  /**
   * Updates the payment in the database.
   *
   * @param payment payment to save
   */
  public void update(Payment payment) {
        try {
            session.beginTransaction();
            session.saveOrUpdate(payment);
            session.getTransaction().commit();
        } catch (Exception e) {
            logger.error("Error while updating payment: {}", e.getMessage());
            session.getTransaction().rollback();
        }
    }
  
  /**
   * Retrieves the payment from the database.
   *
   * @return payment the payment or null
   */
  public Payment get(String id) {
        Payment payment = null;
        try {
            Query query = session.createQuery("from Payment where id = :id");
            query.setParameter("id", id);
            payment = (Payment) query.uniqueResult();
        } catch (HibernateException e) {
            logger.error("Error retrieving payment with id: " + id, e);
        }
        return payment;
    }
  
  /**
   * Deletes the payment from the database.
   *
   * @param payment payment to save
   */
  public void delete(Payment payment) {
        try {
            session.beginTransaction();
            session.delete(payment);
            session.getTransaction().commit();
        } catch (Exception e) {
            logger.error("Error deleting payment: " + e.getMessage());
            session.getTransaction().rollback();
        }
    }
}
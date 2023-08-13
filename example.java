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
  }
  
  /**
   * Updates the payment in the database.
   *
   * @param payment payment to save
   */
  public void update(Payment payment) {
  }
  
  /**
   * Retrieves the payment from the database.
   *
   * @return payment the payment or null
   */
  public Payment get(String id) {
  }
  
  /**
   * Deletes the payment from the database.
   *
   * @param payment payment to save
   */
  public void delete(Payment payment) {
  }
}
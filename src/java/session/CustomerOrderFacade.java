/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package session;

import entity.CustomerOrder;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Timothy
 */
@Stateless
public class CustomerOrderFacade extends AbstractFacade<CustomerOrder> {
    @PersistenceContext(unitName = "WebArmoryPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CustomerOrderFacade() {
        super(CustomerOrder.class);
    }
        // overridden - refresh method called to retrieve order id from database
    public CustomerOrder find(Object id) {
        CustomerOrder order = em.find(CustomerOrder.class, id);
        em.refresh(order);
        return order;
    }
        // in this implementation, there is only one order per customer
    // the data model however allows for multiple orders per customer
    @RolesAllowed("webArmoryAdmin")
    public CustomerOrder findByCustomer(Object customerId) {
        return (CustomerOrder) em.createNamedQuery("CustomerOrder.findByCustomer").setParameter("customerId", customerId).getSingleResult();
    }
}

<?php

namespace AppBundle\Controller\Admin\Crud;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\OrderStatusLabel;
use AppBundle\Form\OrderStatusLabelType;

/**
 * OrderStatusLabel controller.
 *
 * @Route("/admin/orderstatuslabel")
 */
class OrderStatusLabelController extends Controller
{
    /**
     * Lists all OrderStatusLabel entities.
     *
     * @Route("/", name="admin_orderstatuslabel_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $orderStatusLabels = $em->getRepository('AppBundle:OrderStatusLabel')->findAll();

        return $this->render('admin/crud/orderstatuslabel/index.html.twig', array(
            'orderStatusLabels' => $orderStatusLabels,
        ));
    }

    /**
     * Creates a new OrderStatusLabel entity.
     *
     * @Route("/new", name="admin_orderstatuslabel_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $orderStatusLabel = new OrderStatusLabel();
        $form = $this->createForm('AppBundle\Form\OrderStatusLabelType', $orderStatusLabel);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($orderStatusLabel);
            $em->flush();

            return $this->redirectToRoute('admin_orderstatuslabel_show', array('id' => $orderStatusLabel->getId()));
        }

        return $this->render('admin/crud/orderstatuslabel/new.html.twig', array(
            'orderStatusLabel' => $orderStatusLabel,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a OrderStatusLabel entity.
     *
     * @Route("/{id}", name="admin_orderstatuslabel_show")
     * @Method("GET")
     */
    public function showAction(OrderStatusLabel $orderStatusLabel)
    {
        $deleteForm = $this->createDeleteForm($orderStatusLabel);

        return $this->render('admin/crud/orderstatuslabel/show.html.twig', array(
            'orderStatusLabel' => $orderStatusLabel,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing OrderStatusLabel entity.
     *
     * @Route("/{id}/edit", name="admin_orderstatuslabel_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, OrderStatusLabel $orderStatusLabel)
    {
        $deleteForm = $this->createDeleteForm($orderStatusLabel);
        $editForm = $this->createForm('AppBundle\Form\OrderStatusLabelType', $orderStatusLabel);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($orderStatusLabel);
            $em->flush();

            return $this->redirectToRoute('admin_orderstatuslabel_edit', array('id' => $orderStatusLabel->getId()));
        }

        return $this->render('admin/crud/orderstatuslabel/edit.html.twig', array(
            'orderStatusLabel' => $orderStatusLabel,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a OrderStatusLabel entity.
     *
     * @Route("/{id}", name="admin_orderstatuslabel_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, OrderStatusLabel $orderStatusLabel)
    {
        $form = $this->createDeleteForm($orderStatusLabel);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($orderStatusLabel);
            $em->flush();
        }

        return $this->redirectToRoute('admin_orderstatuslabel_index');
    }

    /**
     * Creates a form to delete a OrderStatusLabel entity.
     *
     * @param OrderStatusLabel $orderStatusLabel The OrderStatusLabel entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(OrderStatusLabel $orderStatusLabel)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_orderstatuslabel_delete', array('id' => $orderStatusLabel->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}

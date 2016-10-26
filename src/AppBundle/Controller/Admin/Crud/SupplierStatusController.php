<?php

namespace AppBundle\Controller\Admin\Crud;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\SupplierStatus;
use AppBundle\Form\SupplierStatusType;

/**
 * SupplierStatus controller.
 *
 * @Route("/admin/supplierstatus")
 */
class SupplierStatusController extends Controller
{
    /**
     * Lists all SupplierStatus entities.
     *
     * @Route("/", name="admin_supplierstatus_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $supplierStatuses = $em->getRepository('AppBundle:SupplierStatus')->findAll();

        return $this->render('admin/crud/supplierstatus/index.html.twig', array(
            'supplierStatuses' => $supplierStatuses,
        ));
    }

    /**
     * Creates a new SupplierStatus entity.
     *
     * @Route("/new", name="admin_supplierstatus_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $supplierStatus = new SupplierStatus();
        $form = $this->createForm('AppBundle\Form\SupplierStatusType', $supplierStatus);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($supplierStatus);
            $em->flush();

            return $this->redirectToRoute('admin_supplierstatus_show', array('id' => $supplierStatus->getId()));
        }

        return $this->render('admin/crud/supplierstatus/new.html.twig', array(
            'supplierStatus' => $supplierStatus,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a SupplierStatus entity.
     *
     * @Route("/{id}", name="admin_supplierstatus_show")
     * @Method("GET")
     */
    public function showAction(SupplierStatus $supplierStatus)
    {
        $deleteForm = $this->createDeleteForm($supplierStatus);

        return $this->render('admin/crud/supplierstatus/show.html.twig', array(
            'supplierStatus' => $supplierStatus,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing SupplierStatus entity.
     *
     * @Route("/{id}/edit", name="admin_supplierstatus_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, SupplierStatus $supplierStatus)
    {
        $deleteForm = $this->createDeleteForm($supplierStatus);
        $editForm = $this->createForm('AppBundle\Form\SupplierStatusType', $supplierStatus);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($supplierStatus);
            $em->flush();

            return $this->redirectToRoute('admin_supplierstatus_edit', array('id' => $supplierStatus->getId()));
        }

        return $this->render('admin/crud/supplierstatus/edit.html.twig', array(
            'supplierStatus' => $supplierStatus,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a SupplierStatus entity.
     *
     * @Route("/{id}", name="admin_supplierstatus_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, SupplierStatus $supplierStatus)
    {
        $form = $this->createDeleteForm($supplierStatus);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($supplierStatus);
            $em->flush();
        }

        return $this->redirectToRoute('admin_supplierstatus_index');
    }

    /**
     * Creates a form to delete a SupplierStatus entity.
     *
     * @param SupplierStatus $supplierStatus The SupplierStatus entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(SupplierStatus $supplierStatus)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_supplierstatus_delete', array('id' => $supplierStatus->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}

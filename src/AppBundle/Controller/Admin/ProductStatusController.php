<?php

namespace AppBundle\Controller\Admin;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\ProductStatus;
use AppBundle\Form\ProductStatusType;

/**
 * ProductStatus controller.
 *
 * @Route("/admin/productstatus")
 */
class ProductStatusController extends Controller
{
    /**
     * Lists all ProductStatus entities.
     *
     * @Route("/", name="admin_productstatus_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $productStatuses = $em->getRepository('AppBundle:ProductStatus')->findAll();

        return $this->render('productstatus/index.html.twig', array(
            'productStatuses' => $productStatuses,
        ));
    }

    /**
     * Creates a new ProductStatus entity.
     *
     * @Route("/new", name="admin_productstatus_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $productStatus = new ProductStatus();
        $form = $this->createForm('AppBundle\Form\ProductStatusType', $productStatus);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($productStatus);
            $em->flush();

            return $this->redirectToRoute('admin_productstatus_show', array('id' => $productStatus->getId()));
        }

        return $this->render('productstatus/new.html.twig', array(
            'productStatus' => $productStatus,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a ProductStatus entity.
     *
     * @Route("/{id}", name="admin_productstatus_show")
     * @Method("GET")
     */
    public function showAction(ProductStatus $productStatus)
    {
        $deleteForm = $this->createDeleteForm($productStatus);

        return $this->render('productstatus/show.html.twig', array(
            'productStatus' => $productStatus,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing ProductStatus entity.
     *
     * @Route("/{id}/edit", name="admin_productstatus_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, ProductStatus $productStatus)
    {
        $deleteForm = $this->createDeleteForm($productStatus);
        $editForm = $this->createForm('AppBundle\Form\ProductStatusType', $productStatus);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($productStatus);
            $em->flush();

            return $this->redirectToRoute('admin_productstatus_edit', array('id' => $productStatus->getId()));
        }

        return $this->render('productstatus/edit.html.twig', array(
            'productStatus' => $productStatus,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a ProductStatus entity.
     *
     * @Route("/{id}", name="admin_productstatus_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, ProductStatus $productStatus)
    {
        $form = $this->createDeleteForm($productStatus);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($productStatus);
            $em->flush();
        }

        return $this->redirectToRoute('admin_productstatus_index');
    }

    /**
     * Creates a form to delete a ProductStatus entity.
     *
     * @param ProductStatus $productStatus The ProductStatus entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(ProductStatus $productStatus)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_productstatus_delete', array('id' => $productStatus->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}

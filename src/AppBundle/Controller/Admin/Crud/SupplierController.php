<?php

namespace AppBundle\Controller\Admin\Crud;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Supplier;
use AppBundle\Form\SupplierType;
use Symfony\Component\Validator\Constraints\Date;

/**
 * Supplier controller.
 *
 * @Route("/admin/supplier")
 */
class SupplierController extends Controller
{
    /**
     * Lists all Supplier entities.
     *
     * @Route("/", name="admin_supplier_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $suppliers = $em->getRepository('AppBundle:Supplier')->findAll();

        return $this->render('admin/crud/supplier/index.html.twig', array(
            'suppliers' => $suppliers,
        ));
    }

    /**
     * Creates a new Supplier entity.
     *
     * @Route("/new", name="admin_supplier_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $supplier = new Supplier();
        $form = $this->createForm('AppBundle\Form\SupplierType', $supplier);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($supplier);
            $em->flush();

            return $this->redirectToRoute('admin_supplier_show', array('id' => $supplier->getId()));
        }

        return $this->render('admin/crud/supplier/new.html.twig', array(
            'supplier' => $supplier,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Supplier entity.
     *
     * @Route("/{id}", name="admin_supplier_show")
     * @Method("GET")
     */
    public function showAction(Supplier $supplier)
    {
        $deleteForm = $this->createDeleteForm($supplier);

        return $this->render('admin/crud/supplier/show.html.twig', array(
            'supplier' => $supplier,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Supplier entity.
     *
     * @Route("/{id}/edit", name="admin_supplier_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Supplier $supplier)
    {
        $deleteForm = $this->createDeleteForm($supplier);
        $editForm = $this->createForm('AppBundle\Form\SupplierType', $supplier);
        $editForm->handleRequest($request);

        $supplier->setUpdatedAt(new \DateTime());

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($supplier);
            $em->flush();

            return $this->redirectToRoute('admin_supplier_edit', array('id' => $supplier->getId()));
        }

        return $this->render('admin/crud/supplier/edit.html.twig', array(
            'supplier' => $supplier,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Supplier entity.
     *
     * @Route("/{id}", name="admin_supplier_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Supplier $supplier)
    {
        $form = $this->createDeleteForm($supplier);
        $form->handleRequest($request);

        $supplier->setDeletedAt(new \DateTime());

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($supplier);
            $em->flush();
        }

        return $this->redirectToRoute('admin_supplier_index');
    }

    /**
     * Creates a form to delete a Supplier entity.
     *
     * @param Supplier $supplier The Supplier entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Supplier $supplier)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_supplier_delete', array('id' => $supplier->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}

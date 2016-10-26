<?php

namespace AppBundle\Controller\Admin\Crud;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\ProductMediaType;
use AppBundle\Form\ProductMediaTypeType;

/**
 * ProductMediaType controller.
 *
 * @Route("/admin/productmediatype")
 */
class ProductMediaTypeController extends Controller
{
    /**
     * Lists all ProductMediaType entities.
     *
     * @Route("/", name="admin_productmediatype_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $productMediaTypes = $em->getRepository('AppBundle:ProductMediaType')->findAll();

        return $this->render('admin/crud/productmediatype/index.html.twig', array(
            'productMediaTypes' => $productMediaTypes,
        ));
    }

    /**
     * Creates a new ProductMediaType entity.
     *
     * @Route("/new", name="admin_productmediatype_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $productMediaType = new ProductMediaType();
        $form = $this->createForm('AppBundle\Form\ProductMediaTypeType', $productMediaType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($productMediaType);
            $em->flush();

            return $this->redirectToRoute('admin_productmediatype_show', array('id' => $productMediaType->getId()));
        }

        return $this->render('admin/crud/productmediatype/new.html.twig', array(
            'productMediaType' => $productMediaType,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a ProductMediaType entity.
     *
     * @Route("/{id}", name="admin_productmediatype_show")
     * @Method("GET")
     */
    public function showAction(ProductMediaType $productMediaType)
    {
        $deleteForm = $this->createDeleteForm($productMediaType);

        return $this->render('admin/crud/productmediatype/show.html.twig', array(
            'productMediaType' => $productMediaType,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing ProductMediaType entity.
     *
     * @Route("/{id}/edit", name="admin_productmediatype_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, ProductMediaType $productMediaType)
    {
        $deleteForm = $this->createDeleteForm($productMediaType);
        $editForm = $this->createForm('AppBundle\Form\ProductMediaTypeType', $productMediaType);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($productMediaType);
            $em->flush();

            return $this->redirectToRoute('admin_productmediatype_edit', array('id' => $productMediaType->getId()));
        }

        return $this->render('admin/crud/productmediatype/edit.html.twig', array(
            'productMediaType' => $productMediaType,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a ProductMediaType entity.
     *
     * @Route("/{id}", name="admin_productmediatype_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, ProductMediaType $productMediaType)
    {
        $form = $this->createDeleteForm($productMediaType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($productMediaType);
            $em->flush();
        }

        return $this->redirectToRoute('admin_productmediatype_index');
    }

    /**
     * Creates a form to delete a ProductMediaType entity.
     *
     * @param ProductMediaType $productMediaType The ProductMediaType entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(ProductMediaType $productMediaType)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_productmediatype_delete', array('id' => $productMediaType->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}

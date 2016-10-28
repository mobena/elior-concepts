<?php

namespace AppBundle\Controller\Admin\Crud;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\ProductMedia;
use AppBundle\Form\ProductMediasType;

/**
 * ProductMedia controller.
 *
 * @Route("/admin/productmedia")
 */
class ProductMediaController extends Controller
{
    /**
     * Lists all ProductMedia entities.
     *
     * @Route("/", name="admin_productmedia_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $productMedia = $em->getRepository('AppBundle:ProductMedia')->findAll();

        return $this->render('admin/crud/productmedia/index.html.twig', array(
            'productMedia' => $productMedia,
        ));
    }

    /**
     * Creates a new ProductMedia entity.
     *
     * @Route("/new", name="admin_productmedia_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $productMedia = new ProductMedia();
        $form = $this->createForm('AppBundle\Form\ProductMediasType', $productMedia);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($productMedia);
            $em->flush();

            return $this->redirectToRoute('admin_productmedia_show', array('id' => $productMedia->getId()));
        }

        return $this->render('admin/crud/productmedia/new.html.twig', array(
            'productMedia' => $productMedia,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a ProductMedia entity.
     *
     * @Route("/{id}", name="admin_productmedia_show")
     * @Method("GET")
     */
    public function showAction(ProductMedia $productMedia)
    {
        $deleteForm = $this->createDeleteForm($productMedia);

        return $this->render('admin/crud/productmedia/show.html.twig', array(
            'productMedia' => $productMedia,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing ProductMedia entity.
     *
     * @Route("/{id}/edit", name="admin_productmedia_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, ProductMedia $productMedia)
    {
        $deleteForm = $this->createDeleteForm($productMedia);
        $editForm = $this->createForm('AppBundle\Form\ProductMediasType', $productMedia);
        $editForm->handleRequest($request);

        $productMedia->setUpdatedAt(new \DateTime());

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($productMedia);
            $em->flush();

            return $this->redirectToRoute('admin_productmedia_edit', array('id' => $productMedia->getId()));
        }

        return $this->render('admin/crud/productmedia/edit.html.twig', array(
            'productMedia' => $productMedia,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a ProductMedia entity.
     *
     * @Route("/{id}", name="admin_productmedia_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, ProductMedia $productMedia)
    {
        $form = $this->createDeleteForm($productMedia);
        $form->handleRequest($request);

        $productMedia->setDeletedAt(new \DateTime());

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($productMedia);
            $em->flush();
        }

        return $this->redirectToRoute('admin_productmedia_index');
    }

    /**
     * Creates a form to delete a ProductMedia entity.
     *
     * @param ProductMedia $productMedia The ProductMedia entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(ProductMedia $productMedia)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_productmedia_delete', array('id' => $productMedia->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}

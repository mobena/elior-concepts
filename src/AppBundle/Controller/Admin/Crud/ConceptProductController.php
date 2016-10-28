<?php

namespace AppBundle\Controller\Admin\Crud;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\ConceptProduct;
use AppBundle\Form\ConceptProductType;

/**
 * ConceptProduct controller.
 *
 * @Route("/admin/conceptproduct")
 */
class ConceptProductController extends Controller
{
    /**
     * Lists all ConceptProduct entities.
     *
     * @Route("/", name="admin_conceptproduct_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $conceptProducts = $em->getRepository('AppBundle:ConceptProduct')->findAll();

        return $this->render('admin/crud/conceptproduct/index.html.twig', array(
            'conceptProducts' => $conceptProducts,
        ));
    }

    /**
     * Creates a new ConceptProduct entity.
     *
     * @Route("/new", name="admin_conceptproduct_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $conceptProduct = new ConceptProduct();
        $form = $this->createForm('AppBundle\Form\ConceptProductType', $conceptProduct);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($conceptProduct);
            $em->flush();

            return $this->redirectToRoute('admin_conceptproduct_show', array('id' => $conceptProduct->getId()));
        }

        return $this->render('admin/crud/conceptproduct/new.html.twig', array(
            'conceptProduct' => $conceptProduct,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a ConceptProduct entity.
     *
     * @Route("/{id}", name="admin_conceptproduct_show")
     * @Method("GET")
     */
    public function showAction(ConceptProduct $conceptProduct)
    {
        $deleteForm = $this->createDeleteForm($conceptProduct);

        return $this->render('admin/crud/conceptproduct/show.html.twig', array(
            'conceptProduct' => $conceptProduct,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing ConceptProduct entity.
     *
     * @Route("/{id}/edit", name="admin_conceptproduct_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, ConceptProduct $conceptProduct)
    {
        $deleteForm = $this->createDeleteForm($conceptProduct);
        $editForm = $this->createForm('AppBundle\Form\ConceptProductType', $conceptProduct);
        $editForm->handleRequest($request);

        $conceptProduct->setUpdatedAt(new \DateTime());

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($conceptProduct);
            $em->flush();

            return $this->redirectToRoute('admin_conceptproduct_edit', array('id' => $conceptProduct->getId()));
        }

        return $this->render('admin/crud/conceptproduct/edit.html.twig', array(
            'conceptProduct' => $conceptProduct,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a ConceptProduct entity.
     *
     * @Route("/{id}", name="admin_conceptproduct_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, ConceptProduct $conceptProduct)
    {
        $form = $this->createDeleteForm($conceptProduct);
        $form->handleRequest($request);

        $conceptProduct->setDeletedAt(new \DateTime());

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($conceptProduct);
            $em->flush();
        }

        return $this->redirectToRoute('admin_conceptproduct_index');
    }

    /**
     * Creates a form to delete a ConceptProduct entity.
     *
     * @param ConceptProduct $conceptProduct The ConceptProduct entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(ConceptProduct $conceptProduct)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_conceptproduct_delete', array('id' => $conceptProduct->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}

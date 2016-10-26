<?php

namespace AppBundle\Controller\Admin\Crud;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\ConceptMediaType;
use AppBundle\Form\ConceptMediaTypeType;

/**
 * ConceptMediaType controller.
 *
 * @Route("/admin/conceptmediatype")
 */
class ConceptMediaTypeController extends Controller
{
    /**
     * Lists all ConceptMediaType entities.
     *
     * @Route("/", name="admin_conceptmediatype_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $conceptMediaTypes = $em->getRepository('AppBundle:ConceptMediaType')->findAll();

        return $this->render('admin/crud/conceptmediatype/index.html.twig', array(
            'conceptMediaTypes' => $conceptMediaTypes,
        ));
    }

    /**
     * Creates a new ConceptMediaType entity.
     *
     * @Route("/new", name="admin_conceptmediatype_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $conceptMediaType = new ConceptMediaType();
        $form = $this->createForm('AppBundle\Form\ConceptMediaTypeType', $conceptMediaType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($conceptMediaType);
            $em->flush();

            return $this->redirectToRoute('admin_conceptmediatype_show', array('id' => $conceptMediaType->getId()));
        }

        return $this->render('admin/crud/conceptmediatype/new.html.twig', array(
            'conceptMediaType' => $conceptMediaType,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a ConceptMediaType entity.
     *
     * @Route("/{id}", name="admin_conceptmediatype_show")
     * @Method("GET")
     */
    public function showAction(ConceptMediaType $conceptMediaType)
    {
        $deleteForm = $this->createDeleteForm($conceptMediaType);

        return $this->render('admin/crud/conceptmediatype/show.html.twig', array(
            'conceptMediaType' => $conceptMediaType,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing ConceptMediaType entity.
     *
     * @Route("/{id}/edit", name="admin_conceptmediatype_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, ConceptMediaType $conceptMediaType)
    {
        $deleteForm = $this->createDeleteForm($conceptMediaType);
        $editForm = $this->createForm('AppBundle\Form\ConceptMediaTypeType', $conceptMediaType);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($conceptMediaType);
            $em->flush();

            return $this->redirectToRoute('admin_conceptmediatype_edit', array('id' => $conceptMediaType->getId()));
        }

        return $this->render('admin/crud/conceptmediatype/edit.html.twig', array(
            'conceptMediaType' => $conceptMediaType,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a ConceptMediaType entity.
     *
     * @Route("/{id}", name="admin_conceptmediatype_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, ConceptMediaType $conceptMediaType)
    {
        $form = $this->createDeleteForm($conceptMediaType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($conceptMediaType);
            $em->flush();
        }

        return $this->redirectToRoute('admin_conceptmediatype_index');
    }

    /**
     * Creates a form to delete a ConceptMediaType entity.
     *
     * @param ConceptMediaType $conceptMediaType The ConceptMediaType entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(ConceptMediaType $conceptMediaType)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_conceptmediatype_delete', array('id' => $conceptMediaType->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}

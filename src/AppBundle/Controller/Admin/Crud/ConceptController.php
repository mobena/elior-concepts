<?php

namespace AppBundle\Controller\Admin\Crud;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\Concept;
use AppBundle\Form\ConceptType;

/**
 * Concept controller.
 *
 * @Route("/admin/concept")
 */
class ConceptController extends Controller
{
    /**
     * Lists all Concept entities.
     *
     * @Route("/", name="admin_concept_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $concepts = $em->getRepository('AppBundle:Concept')->findAll();

        return $this->render('admin/crud/concept/index.html.twig', array(
            'concepts' => $concepts,
        ));
    }

    /**
     * Creates a new Concept entity.
     *
     * @Route("/new", name="admin_concept_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $concept = new Concept();
        $form = $this->createForm('AppBundle\Form\ConceptType', $concept);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($concept);
            $em->flush();

            return $this->redirectToRoute('admin_concept_show', array('id' => $concept->getId()));
        }

        return $this->render('admin/crud/concept/new.html.twig', array(
            'concept' => $concept,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Concept entity.
     *
     * @Route("/{id}", name="admin_concept_show")
     * @Method("GET")
     */
    public function showAction(Concept $concept)
    {
        $deleteForm = $this->createDeleteForm($concept);

        return $this->render('admin/crud/concept/show.html.twig', array(
            'concept' => $concept,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Concept entity.
     *
     * @Route("/{id}/edit", name="admin_concept_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Concept $concept)
    {
        $deleteForm = $this->createDeleteForm($concept);
        $editForm = $this->createForm('AppBundle\Form\ConceptType', $concept);
        $editForm->handleRequest($request);

        $concept->setUpdatedAt(new \DateTime());

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($concept);
            $em->flush();

            return $this->redirectToRoute('admin_concept_edit', array('id' => $concept->getId()));
        }

        return $this->render('admin/crud/concept/edit.html.twig', array(
            'concept' => $concept,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Concept entity.
     *
     * @Route("/{id}", name="admin_concept_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Concept $concept)
    {
        $form = $this->createDeleteForm($concept);
        $form->handleRequest($request);

        $concept->setDeletedAt(new \DateTime());

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($concept);
            $em->flush();
        }

        return $this->redirectToRoute('admin_concept_index');
    }

    /**
     * Creates a form to delete a Concept entity.
     *
     * @param Concept $concept The Concept entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Concept $concept)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_concept_delete', array('id' => $concept->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}

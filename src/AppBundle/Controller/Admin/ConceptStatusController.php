<?php

namespace AppBundle\Controller\Admin;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use AppBundle\Entity\ConceptStatus;
use AppBundle\Form\ConceptStatusType;

/**
 * ConceptStatus controller.
 *
 * @Route("/admin/conceptstatus")
 */
class ConceptStatusController extends Controller
{
    /**
     * Lists all ConceptStatus entities.
     *
     * @Route("/", name="admin_conceptstatus_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $conceptStatuses = $em->getRepository('AppBundle:ConceptStatus')->findAll();

        return $this->render('conceptstatus/index.html.twig', array(
            'conceptStatuses' => $conceptStatuses,
        ));
    }

    /**
     * Creates a new ConceptStatus entity.
     *
     * @Route("/new", name="admin_conceptstatus_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $conceptStatus = new ConceptStatus();
        $form = $this->createForm('AppBundle\Form\ConceptStatusType', $conceptStatus);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($conceptStatus);
            $em->flush();

            return $this->redirectToRoute('admin_conceptstatus_show', array('id' => $conceptStatus->getId()));
        }

        return $this->render('conceptstatus/new.html.twig', array(
            'conceptStatus' => $conceptStatus,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a ConceptStatus entity.
     *
     * @Route("/{id}", name="admin_conceptstatus_show")
     * @Method("GET")
     */
    public function showAction(ConceptStatus $conceptStatus)
    {
        $deleteForm = $this->createDeleteForm($conceptStatus);

        return $this->render('conceptstatus/show.html.twig', array(
            'conceptStatus' => $conceptStatus,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing ConceptStatus entity.
     *
     * @Route("/{id}/edit", name="admin_conceptstatus_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, ConceptStatus $conceptStatus)
    {
        $deleteForm = $this->createDeleteForm($conceptStatus);
        $editForm = $this->createForm('AppBundle\Form\ConceptStatusType', $conceptStatus);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($conceptStatus);
            $em->flush();

            return $this->redirectToRoute('admin_conceptstatus_edit', array('id' => $conceptStatus->getId()));
        }

        return $this->render('conceptstatus/edit.html.twig', array(
            'conceptStatus' => $conceptStatus,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a ConceptStatus entity.
     *
     * @Route("/{id}", name="admin_conceptstatus_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, ConceptStatus $conceptStatus)
    {
        $form = $this->createDeleteForm($conceptStatus);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($conceptStatus);
            $em->flush();
        }

        return $this->redirectToRoute('admin_conceptstatus_index');
    }

    /**
     * Creates a form to delete a ConceptStatus entity.
     *
     * @param ConceptStatus $conceptStatus The ConceptStatus entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(ConceptStatus $conceptStatus)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_conceptstatus_delete', array('id' => $conceptStatus->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}

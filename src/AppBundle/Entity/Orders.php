<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use AppBundle\Entity\OrderType;
use AppBundle\Entity\Client;
use AppBundle\Entity\OrderStatus;
use AppBundle\Entity\User;

/**
 * Orders
 *
 * @ORM\Table(name="orders")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\OrdersRepository")
 */
class Orders
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\OrderType")
     * @ORM\JoinColumn(nullable=false)
     */
    private $orderType;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Client")
     * @ORM\JoinColumn(nullable=false)
     */
    private $client;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\OrderStatus")
     * @ORM\JoinColumn(nullable=false)
     */
    private $currentOrderStatus;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\User")
     * @ORM\JoinColumn(nullable=false)
     */
    private $creator;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\User")
     * @ORM\JoinColumn(nullable=true)
     */
    private $updator;

    /**
     * @var float
     *
     * @ORM\Column(name="products_total_price", type="float")
     */
    private $productsTotalPrice;

    /**
     * @var float
     *
     * @ORM\Column(name="delivery_price_ht", type="float")
     */
    private $deliveryPriceHt;

    /**
     * @var float
     *
     * @ORM\Column(name="discount_price_ht", type="float")
     */
    private $discountPriceHt;

    /**
     * @var float
     *
     * @ORM\Column(name="final_price_ht", type="float")
     */
    private $finalPriceHt;

    /**
     * @var float
     *
     * @ORM\Column(name="final_price_ttc", type="float")
     */
    private $finalPriceTtc;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_at", type="datetime")
     */
    private $createdAt;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="updated_at", type="datetime", nullable=true)
     */
    private $updatedAt;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="validated_at", type="datetime", nullable=true)
     */
    private $validatedAt;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="deleted_at", type="datetime", nullable=true)
     */
    private $deletedAt;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set productsTotalPrice
     *
     * @param float $productsTotalPrice
     *
     * @return Orders
     */
    public function setProductsTotalPrice($productsTotalPrice)
    {
        $this->productsTotalPrice = $productsTotalPrice;

        return $this;
    }

    /**
     * Get productsTotalPrice
     *
     * @return float
     */
    public function getProductsTotalPrice()
    {
        return $this->productsTotalPrice;
    }

    /**
     * Set deliveryPriceHt
     *
     * @param float $deliveryPriceHt
     *
     * @return Orders
     */
    public function setDeliveryPriceHt($deliveryPriceHt)
    {
        $this->deliveryPriceHt = $deliveryPriceHt;

        return $this;
    }

    /**
     * Get deliveryPriceHt
     *
     * @return float
     */
    public function getDeliveryPriceHt()
    {
        return $this->deliveryPriceHt;
    }

    /**
     * Set discountPriceHt
     *
     * @param float $discountPriceHt
     *
     * @return Orders
     */
    public function setDiscountPriceHt($discountPriceHt)
    {
        $this->discountPriceHt = $discountPriceHt;

        return $this;
    }

    /**
     * Get discountPriceHt
     *
     * @return float
     */
    public function getDiscountPriceHt()
    {
        return $this->discountPriceHt;
    }

    /**
     * Set finalPriceHt
     *
     * @param float $finalPriceHt
     *
     * @return Orders
     */
    public function setFinalPriceHt($finalPriceHt)
    {
        $this->finalPriceHt = $finalPriceHt;

        return $this;
    }

    /**
     * Get finalPriceHt
     *
     * @return float
     */
    public function getFinalPriceHt()
    {
        return $this->finalPriceHt;
    }

    /**
     * Set finalPriceTtc
     *
     * @param float $finalPriceTtc
     *
     * @return Orders
     */
    public function setFinalPriceTtc($finalPriceTtc)
    {
        $this->finalPriceTtc = $finalPriceTtc;

        return $this;
    }

    /**
     * Get finalPriceTtc
     *
     * @return float
     */
    public function getFinalPriceTtc()
    {
        return $this->finalPriceTtc;
    }

    /**
     * Set createdAt
     *
     * @param \DateTime $createdAt
     *
     * @return Orders
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Get createdAt
     *
     * @return \DateTime
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * Set updatedAt
     *
     * @param \DateTime $updatedAt
     *
     * @return Orders
     */
    public function setUpdatedAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    /**
     * Get updatedAt
     *
     * @return \DateTime
     */
    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }

    /**
     * Set validatedAt
     *
     * @param \DateTime $validatedAt
     *
     * @return Orders
     */
    public function setValidatedAt($validatedAt)
    {
        $this->validatedAt = $validatedAt;

        return $this;
    }

    /**
     * Get validatedAt
     *
     * @return \DateTime
     */
    public function getValidatedAt()
    {
        return $this->validatedAt;
    }

    /**
     * Set deletedAt
     *
     * @param \DateTime $deletedAt
     *
     * @return Orders
     */
    public function setDeletedAt($deletedAt)
    {
        $this->deletedAt = $deletedAt;

        return $this;
    }

    /**
     * Get deletedAt
     *
     * @return \DateTime
     */
    public function getDeletedAt()
    {
        return $this->deletedAt;
    }

    /**
     * @return mixed
     */
    public function getOrderType()
    {
        return $this->orderType;
    }

    /**
     * @param mixed $orderType
     */
    public function setOrderType($orderType)
    {
        $this->orderType = $orderType;
    }

    /**
     * @return mixed
     */
    public function getClient()
    {
        return $this->client;
    }

    /**
     * @param mixed $client
     */
    public function setClient($client)
    {
        $this->client = $client;
    }

    /**
     * @return mixed
     */
    public function getCurrentOrderStatus()
    {
        return $this->currentOrderStatus;
    }

    /**
     * @param mixed $currentOrderStatus
     */
    public function setCurrentOrderStatus($currentOrderStatus)
    {
        $this->currentOrderStatus = $currentOrderStatus;
    }

    /**
     * @return mixed
     */
    public function getCreator()
    {
        return $this->creator;
    }

    /**
     * @param mixed $creator
     */
    public function setCreator($creator)
    {
        $this->creator = $creator;
    }

    /**
     * @return mixed
     */
    public function getUpdator()
    {
        return $this->updator;
    }

    /**
     * @param mixed $updator
     */
    public function setUpdator($updator)
    {
        $this->updator = $updator;
    }
}


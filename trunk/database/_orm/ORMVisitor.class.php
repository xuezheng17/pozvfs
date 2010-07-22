<?php
class ORMVisitor extends ORMBase {
  public function __construct() {
    parent::__construct('Visitor');
  }

  public function __toEpObject($myManager, $epObject, $object) {
    $epObject->trackId = isset($object->trackId) ? $object->trackId : '';
    $epObject->createdDate = (isset($object->createdDate) && $object->createdDate) ? SimpleDate::toStamp($object->createdDate) : 0;
    $epObject->creator = isset($object->creator) ? $object->creator : '';
    $epObject->weddingDay = (isset($object->weddingDay) && $object->weddingDay) ? SimpleDate::toStamp($object->weddingDay) : 0;
    $epObject->brideName = isset($object->brideName) ? $object->brideName : '';
    $epObject->bridePhone = isset($object->bridePhone) ? $object->bridePhone : '';
    $epObject->brideMobile = isset($object->brideMobile) ? $object->brideMobile : '';
    $epObject->brideEmail = isset($object->brideEmail) ? $object->brideEmail : '';
    $epObject->brideAddress = isset($object->brideAddress) ? $object->brideAddress : '';
    $epObject->groomName = isset($object->groomName) ? $object->groomName : '';
    $epObject->groomPhone = isset($object->groomPhone) ? $object->groomPhone : '';
    $epObject->groomMobile = isset($object->groomMobile) ? $object->groomMobile : '';
    $epObject->groomEmail = isset($object->groomEmail) ? $object->groomEmail : '';
    $epObject->groomAddress = isset($object->groomAddress) ? $object->groomAddress : '';
    $epObject->groomAddress = isset($object->groomAddress) ? $object->groomAddress : '';
    $epObject->culturalBackground = isset($object->culturalBackground) ? $object->culturalBackground : '';
    $epObject->ceremonyLocation = isset($object->ceremonyLocation) ? $object->ceremonyLocation : '';
    $epObject->receptionLoation = isset($object->receptionLoation) ? $object->receptionLoation : '';
    $epObject->source = isset($object->source) ? $object->source : '';
    $epObject->firstVisitMethod = isset($object->firstVisitMethod) ? $object->firstVisitMethod : '';
    $epObject->firstVisitDate = (isset($object->firstVisitDate) && $object->firstVisitDate) ? SimpleDate::toStamp($object->firstVisitDate) : 0;
    $epObject->status = isset($object->status) ? $object->status : 0;
    return $epObject;
  }

  public function __toObject($myManager, $epObject, $object) {
    $object->id = $epObject->oid;
    $object->trackId = $epObject->trackId;
    $object->createdDate = ($epObject->createdDate != 0) ? SimpleDate::fromStamp($epObject->createdDate) : 0;
    $object->creator = $epObject->creator;
    $object->weddingDay = ($epObject->weddingDay != 0) ? SimpleDate::fromStamp($epObject->weddingDay) : 0;
    $object->brideName = $epObject->brideName;
    $object->bridePhone = $epObject->bridePhone;
    $object->brideMobile = $epObject->brideMobile;
    $object->brideEmail = $epObject->brideEmail;
    $object->brideAddress = $epObject->brideAddress;
    $object->groomName = $epObject->groomName;
    $object->groomPhone = $epObject->groomPhone;
    $object->groomMobile = $epObject->groomMobile;
    $object->groomEmail = $epObject->groomEmail;
    $object->groomAddress = $epObject->groomAddress;
    $object->groomAddress = $epObject->groomAddress;
    $object->culturalBackground = $epObject->culturalBackground;
    $object->ceremonyLocation = $epObject->ceremonyLocation;
    $object->receptionLoation = $epObject->receptionLoation;
    $object->source = $epObject->source;
    $object->firstVisitMethod = $epObject->firstVisitMethod;
    $object->firstVisitDate = ($epObject->firstVisitDate != 0) ? SimpleDate::fromStamp($epObject->firstVisitDate) : 0;
    $object->status = $epObject->status;
    return $object;
  }
}
?>

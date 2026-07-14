Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAD2466B48
	for <brcm80211@lists.linux.dev>; Tue, 14 Jul 2026 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034220; cv=none; b=qYA9gcjZM/snsIS/urULhalOIYgxLmEfknGlH3lopTtahPpVtoGjIvhpcCL97w4KLvSt54Tx7VousAYNpwgw1JJefw/mtquaQuqJBsDu5JsCOei7EBkcc92lt23Ositq/H12gb3oxIpbiBkJ7Ovu7jvdAZR9CSP6lBO6oTeLu4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034220; c=relaxed/simple;
	bh=Ti2dfbFWivBPpmkUBysCqI8ozMZs1QHY+vSDlgP3QTc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1juRBwfYvQnF9ISH6QhxMdwCXwgE6FaHmO/t8Z4VCPSHom8mjZ6yQ1GrNKr4aS/XqywiyZY8R+vi943AbDM/89tOqYjVyzd3mPgp37ToBoBmJ/A5oZ7K4GDkWBw4hfEZgVxk+FkJrCUeKO/oV6hxz7o0fokVUa5meLuOVDXJ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=emcV+lzj; arc=none smtp.client-ip=217.10.52.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="emcV+lzj"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1784034218; x=1815570218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ti2dfbFWivBPpmkUBysCqI8ozMZs1QHY+vSDlgP3QTc=;
  b=emcV+lzjkV2akhDrtDy5k5gUnxHuQMdPijRdACxhKHOUNUvVeXnD2Uww
   kiBj0hwENIIt3RD8VSwoe8aYKGLZnZfF8/HCIMD7gs/QZtEDxHB0+4fxg
   WJGYFylTBeOj1OwfjUIDTjEsBTcX1041r6Fvxgv8an+t4aTBgG4twwX4E
   Y=;
X-CSE-ConnectionGUID: YknOIEMrR56XHBe4+Y3snw==
X-CSE-MsgGUID: IfNmwxXQTRqU2IjGyucJPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="100860886"
X-IronPort-AV: E=Sophos;i="6.25,163,1779141600"; 
   d="scan'208";a="100860886"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 15:03:30 +0200
Received: from MUCSE827.infineon.com (172.23.29.20) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 14 Jul
 2026 15:03:29 +0200
Received: from ISCN5CG54722ST.infineon.com (10.161.6.196) by
 MUCSE827.infineon.com (172.23.29.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 14 Jul 2026 15:03:27 +0200
Date: Tue, 14 Jul 2026 13:03:15 +0000
From: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
CC: Arend van Spriel <arend.vanspriel@broadcom.com>,
	<linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>,
	<brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>,
	"Bogdan Nicolae" <bogdan.nicolae@acm.org>,
	<wlan-kernel-dev-list@infineon.com>
Subject: Re: [PATCH] wifi: brcmfmac: cyw: clean up PMKID and cookie code
Message-ID: <cnztilpxknxuyofx2pfdqissbhqtopwoygzr73ux2qmyasqebv@iesg7d6rvxsw>
References: <20260709122315.11400-1-bogdan.nicolae@gmail.com>
 <99c2c345-c594-46e1-b48a-de7f6e52e1c6@broadcom.com>
 <CA+ORkNTNytDi56RJbWHoFXLR2mSAgosz4UxHPgEvCBojmaFOdw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+ORkNTNytDi56RJbWHoFXLR2mSAgosz4UxHPgEvCBojmaFOdw@mail.gmail.com>
X-ClientProxiedBy: MUCSE814.infineon.com (172.23.29.40) To
 MUCSE827.infineon.com (172.23.29.20)

On 07/14, Bogdan Nicolae wrote:
> Hi Arend,
> 
> The code already sets *cookie=0 in the beginning, which according to
> my understanding tells the driver it does not require async tracking
> upstream. This is correct, because the function calls
> wait_for_completion_timeout, so mgmt tx completes by the time we exit
> the function and doesn't need to be tracked upstream. However, while
> we are waiting for mgmt tx to finish, the firmware may generate
> non-matching completion events captured by notify_mgmt_tx_status.
> That's why setting a non-zero packed_id (sent to and returned by
> firmware as part of a completion event) and checking against
> vif->mgmt_tx_id is important.

Avoid top-posting. Need to use interleaved style.
https://en.wikipedia.org/wiki/Posting_style#Interleaved_style

> Cheers,
> Bogdan
> 
> On Sun, Jul 12, 2026 at 5:30 PM Arend van Spriel
> <arend.vanspriel@broadcom.com> wrote:
> >
> > On 09/07/2026 14:23, Bogdan Nicolae wrote:
> > > Avoid setting packet_id to cookie, which is always 0. Instead, use an
> > > increasing atomic counter. Avoids mismatches of completion events later
> > > in brcmf_notify_mgmt_tx_status, where packet_id != vif->mgmt_tx_id is
> > > checked.
> > >
> > > Also, zero out auth_status on initialization. Otherwise, garbage will
> > > leak from the stack to the firmware (when bssid is less than 32 bytes

BSSID will always be less than 32, you must have meant to say "ssid" here
instead of "bssid". Also the auth_req_status struct does not have any "bssid"
member, it only has an "ssid" struct member. Need to fix in commit message.

> > > and/or when params->pmkid is set). Then, pass the params->pmkid to the
> > > firmware (without it, the firmware caches a garbage PMKID on successful
> > > authentication and denies a subsequent association request that includes
> > > the PMKID).
> > >
> > > Signed-off-by: Bogdan Nicolae <bogdan.nicolae@acm.org>
> >
> > I always get a bit confused when people use different email addresses to
> > send and sign-off patches.
> >    > ---
> > >   .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c   | 8 ++++++--
> > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> > > index ce09d44fa..cca53ff19 100644
> > > --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> > > +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
> > > @@ -23,6 +23,8 @@
> > >   #define MGMT_AUTH_FRAME_DWELL_TIME  4000
> > >   #define MGMT_AUTH_FRAME_WAIT_TIME   (MGMT_AUTH_FRAME_DWELL_TIME + 100)
> > >
> > > +static atomic_t brcmf_cyw_mgmt_tx_id = ATOMIC_INIT(0);
> > > +
> > >   static int brcmf_cyw_set_sae_pwd(struct brcmf_if *ifp,
> > >                                struct cfg80211_crypto_settings *crypto)
> > >   {
> > > @@ -155,7 +157,7 @@ int brcmf_cyw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
> > >
> > >       memcpy(&mf_params->da[0], &mgmt->da[0], ETH_ALEN);
> > >       memcpy(&mf_params->bssid[0], &mgmt->bssid[0], ETH_ALEN);
> > > -     mf_params->packet_id = cpu_to_le32(*cookie);
> > > +     mf_params->packet_id = cpu_to_le32(atomic_inc_return(&brcmf_cyw_mgmt_tx_id));
> >
> > As I understand things the cookie value here is an output parameter. The
> > driver should assign it:
> >
> > +       *cookie = atomic_inc_return(&brcmf_cyw_mgmt_tx_id);
> >         mf_params->packet_id = cpu_to_le32(*cookie);

Agree with Arend's suggestion here. It is not correct to leave *cookie = 0 as it
is and only assign a different packet_id while sending requst to firmware, because
in that case the driver will not return the real cookie for this TX to cfg80211.
Driver should assign the generated ID to *cookie and then copy that into packet_id.


Gokul

> > >       memcpy(mf_params->data, &buf[DOT11_MGMT_HDR_LEN],
> > >              le16_to_cpu(mf_params->len));
> > >
> > Regards,
> > Arend
> 

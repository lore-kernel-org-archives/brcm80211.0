Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5DF1D7E38
	for <brcm80211@lists.linux.dev>; Mon,  7 Oct 2024 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728314395; cv=none; b=n/p3PO4i1ZM0muWItqeMFvg/wSF7aQTfLTHKPONN+mA2QDzKj+ecROWEIi9bxVlAVf/Z1eETZ7NQQoTspSCa/TJEQxcM6gwtlakHFtL3TiQvUH8CznSvqEveLnBQ8nEle3fQIzodmaYRRnWdvS/UtvPmn3pDeaR2L9iq0Z6Jm/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728314395; c=relaxed/simple;
	bh=womHcMGrUaOTmX1NCiQbkClbye0iTjbwg8XuB5oKQRQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mmk2thXJCFbZhoYhJNfymX2Ips92bd2zzOzUJH1CftwQ4Rld0CteGLfMaqTe0XqZulyz1lVX5XOGmAJPpTh904Wy5LakugL7BmfuDl+dZhpnz5ct2xrZTuDVeySO3GQbmhJS0P4tz61AUVa/wLO0K+AELozTv54xuX7Aitk0moc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=pxDZh6b5; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="pxDZh6b5"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1728314393; x=1759850393;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=womHcMGrUaOTmX1NCiQbkClbye0iTjbwg8XuB5oKQRQ=;
  b=pxDZh6b5rWpJ3YMcFBv5xqMJmJDVxGloV5DbtuP2zoYKopXxY4phefZT
   KeVAnPYo0aeVpj5xErFr89bL178LCPfGCVPt4DN55+C1LVy1MGbGRWfTr
   +Rsrfa81PSxh3bawXW9ZSR6v97YNKZ/VFK0k2UjFCfOJkwfKU8OqQZE/3
   I=;
X-CSE-ConnectionGUID: 1333NPmQRsWemHTXpjmmVA==
X-CSE-MsgGUID: Mv5VL3bdRM6c+i5mwZyZPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="89805678"
X-IronPort-AV: E=Sophos;i="6.11,184,1725314400"; 
   d="scan'208";a="89805678"
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 17:19:51 +0200
Received: from MUCSE827.infineon.com (172.23.29.20) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 7 Oct
 2024 17:19:50 +0200
Received: from ISCN5CG14747PP.infineon.com (10.161.6.196) by
 MUCSE827.infineon.com (172.23.29.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 7 Oct 2024 17:19:48 +0200
Date: Mon, 7 Oct 2024 20:49:35 +0530
From: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
To: Kalle Valo <kvalo@kernel.org>
CC: Arend van Spriel <arend.vanspriel@broadcom.com>,
	<Syed.Hussain@infineon.com>, <Vinoth.Sampath@infineon.com>,
	<Double.Lo@infineon.com>, <Carter.Chen@infineon.com>,
	<wlan-kernel-dev-list@infineon.com>, <brcm80211@lists.linux.dev>,
	<linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: wifi: brcm80211: add Infineon DEV list for
 communication & maintenance
Message-ID: <ZwP8B8FgDPKEUTXp@ISCN5CG14747PP.infineon.com>
References: <20241007142955.111232-1-gokulkumar.sivakumar@infineon.com>
 <87zfng3rf1.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87zfng3rf1.fsf@kernel.org>
X-ClientProxiedBy: MUCSE812.infineon.com (172.23.29.38) To
 MUCSE827.infineon.com (172.23.29.20)

On 10/07, Kalle Valo wrote:
> Gokul Sivakumar <gokulkumar.sivakumar@infineon.com> writes:
> 
> > The Infineon E-Mail distribution list <wlan-kernel-dev-list@infineon.com>
> > is a replacement for the obsolete list <SHA-cyfmac-dev-list@infineon.com>,
> > which got removed from the BRCM80211 section in the MAINTAINERS file.
> >
> > The new distribution list can be used by the community to contact Infineon
> > WLAN Kernel DEV team, and also for Infineon team to get notified with the
> > activity in the upstream kernel brcm80211 subsystem.
> >
> > Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 77fcd6f802a5..adfbf5af9eb9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4475,6 +4475,7 @@ M:      Arend van Spriel <arend.vanspriel@broadcom.com>
> >  L:   linux-wireless@vger.kernel.org
> >  L:   brcm80211@lists.linux.dev
> >  L:   brcm80211-dev-list.pdl@broadcom.com
> > +L:   wlan-kernel-dev-list@infineon.com
> >  S:   Supported
> >  F:   drivers/net/wireless/broadcom/brcm80211/
> >  F:   include/linux/platform_data/brcmfmac.h
> 
> A lot simpler is that Infineon subscribes to brcm80211@lists.linux.dev
> list, that way there's just one list for all communication. And actually
> broadcom could do the same?
> 
> I'll also fix the linux-wireless list address, it was wrong originally.
> 

For brcm80211 activity related notification, the brcm80211@lists.linux.dev
list seems sufficient. But in addition, more importantly, for the people in
the community having queries specifically regarding the Infineon WLAN
chipset support, it would be helpful to have this E-Mail Distribution list,
So they can notify and communicate with the Infineon WLAN Kernel DEV team.

Gokul

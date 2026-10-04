Received: from mail-oo1-f98.google.com (mail-oo1-f98.google.com [209.85.161.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471F941A502
	for <brcm80211@lists.linux.dev>; Sun,  4 Oct 2026 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107129; cv=none; b=fQGu6T2wEOSlPdiwQoUXlnIUK6Y01fAcCL+VV8YKs3ECSMaUPxFA6/wznrFk9jMB2FTPA9JRCtolFNTvp2fOjfHF3vaOHqSuiomJ3iG8MsXebSC1j/JoPnbIzCoOTdyhK1Pq5h3nboym6ZsJVrmqtEWe6RQxW4z0xtJpkcs9dZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107129; c=relaxed/simple;
	bh=INRGB+/ti9rjpjFdoKVgunKwtrTAl+XMQ4DCWtMzBgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fq3BX40wBU8zMH+legeshP9ZP/cS9qhrspM0mMMStNi2t3nLg9R0L5UhIkxgQoK8c36Ab2nFJMNPErGYcN/R2vXcLGSfKcR89LiRBoF1uI6xN1ILgVuIf+Z8tZejm+BzLn97B46My0iYEdNAaXAvsPsitQSF5snOo18fAPwqIrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WZoO3RJI; arc=none smtp.client-ip=209.85.161.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WZoO3RJI"
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-6dde81a6820so858312eaf.2
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 02:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107120; x=1791711920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JoFX+YMXd60kpER0QJajp4LEvvy2XvMbrnb9b5wYktk=;
        b=G+yJdFf6jkNzFURSjagKJ9Ptli5+pe7QAUcKXIwWIVmr55Eg8iRsfhuGwsmq+A/94q
         2vTMa3qPIFv7x5TODj5q0LypLcQqAxcWmin8eKHN2V9e5gCol7Z8rW+75XD5MpfeNH7y
         SRs8zS7b4yJglErz6IJDqc/2Wqc0peNTxM508STHWta5e4qWUhsj19CSCyPyNQQ0znhL
         6VA9pb5LjJWQmnk4YIH5KxpYJPvGA+BJP8a7X71sa2iSTKVgvVfG/RUQ7ystl4X50OBj
         4WSGLdNuN5+tmk8Kf0UZWPzCHRwXPISpzmGcipRNnjD4anbLJjTQj8EWea+PQMMuWOUR
         zzwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDKv5MVSa5a/0NN7X+qPSgF8sbHSTO62iRf2r16s5mvFEm8+2JtSIswwkN2952w4gw5Mh2lvApVdc=@lists.linux.dev
X-Gm-Message-State: AFuF++m+8REfOLMUaR7h3pxSSFWr03adUrZPo9SzG/8ScXtVuX+lMzsT
	N21YZ9fSbMZ7hCEONrECTrjB6ZmVHbADG5jICDB4qAWs41YFiUnWFIJ66ymoRcNWH20XDvlECrm
	g5Zbm562kRfMiL/bTxCBJrxUygu1Oeo/opF6bR8udV6AKnAg16BvoFSMvGpi4uNvZ+244xdPQY9
	HH4nr9oFMBNU2iOgo36no3nLRfBSQu8jZHH3GCjDu4o5yCFFdJT6ySpQpssSixl6Yfw/5rHBAQV
	Dq5RCj4+HxFgQyD3eMllQ==
X-Gm-Gg: AYBFou2lpvDZUBVqag6oZqOOfVnrDzF8f9J4P3wDN1ey74FSwo9JsXHmqdAiwQB6wKn
	upqTOL3HoqOGl+uteV33hv1raCmNQPDdvo0iA8Yxp5iyCBb8NyJ3ts7KlSRpnNLTxZfsBcMIcc6
	lZZIIyg/yoT0zi4oM/zDiy8GkZAA/daz0p0TfGw3HU+xHL6Qa7vaMf8Jnk0Hrhv1ypYd9wdgvNW
	isLvxcpvVYZyXANvU00Lh0DzMy/lpA2w823nUPuoXg6TajZwZE2fxAiItMT9VXD8djaOw62rfU2
	+sWlKgmN1b1H+OC0Hy71Zx8KM4pPzacYICK6JEYtrQXFy63gdWIulywIUrQPMCuALDiUMdbVUrj
	2XOYfDnivbCL2CKWrLmhPvurEIRiDLUkDKXScgi+fb/UYFmu8N9AqZ/d4jpWO6vIt6pOQj54Om9
	SiXRpLVkY1u02VbyiNirMLkAXsq+2riN237c0l2x/4DQ==
X-Received: by 2002:a05:6820:1ca7:b0:6d7:4c28:5f21 with SMTP id 006d021491bc7-6e09e28126emr3863684eaf.53.1791107119618;
        Sun, 04 Oct 2026 02:45:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6df3b79f481sm53432eaf.25.2026.10.04.02.45.18
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 02:45:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef0362d95so1883600eec.1
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 02:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791107117; x=1791711917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoFX+YMXd60kpER0QJajp4LEvvy2XvMbrnb9b5wYktk=;
        b=WZoO3RJIGwHfE7kD8RVL5/Y8/i30RWRQ+jdOpIsbaSolWoc2U34OULk3T8DVp/bDUB
         9i7jcYWXtoaseO0kplLCxMbIX1p65qJqgtS+lJFNO/MMjxV0VTGH7aUz4niqupEXRazG
         fcJ1UE2Wm+dyb/p7Vr7kUueDHgo49//azeG0U=
X-Forwarded-Encrypted: i=1; AKwUvBy0bXCg8WaiKzZQyHw+u37TJNojeYPAM5z478NeCNwJuaFx2D9zn3WFqRrMbLZ0fjNQuXwLs10JBqI=@lists.linux.dev
X-Received: by 2002:a05:7022:eb42:20b0:144:fc5b:2121 with SMTP id a92af1059eb24-151c30ec64cmr5879793c88.17.1791107116960;
        Sun, 04 Oct 2026 02:45:16 -0700 (PDT)
X-Received: by 2002:a05:7022:eb42:20b0:144:fc5b:2121 with SMTP id a92af1059eb24-151c30ec64cmr5879764c88.17.1791107116264;
        Sun, 04 Oct 2026 02:45:16 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm12736954c88.15.2026.10.04.02.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:45:15 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: Improve D3 substate entering timeout handling
Date: Sun,  4 Oct 2026 02:45:10 -0700
Message-ID: <20261004094510.1323851-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com>
References: <20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 15 Sep 2026 02:50:39 +0200, Sebastian Reichel wrote:
> Some firmwares (e.g. BCM43752) do not service the D3_INFORM mailbox
> handshake when idle, so the D3 ACK never arrives. If WoWL is not armed
> the device is going to be powered off during system suspend and
> re-probed on resume anyway (brcmf_pcie_pm_leave_D3() handles that), so
> the missing ACK is harmless and must not abort the whole system suspend.
> When WoWL is active the device has to stay powered with its state
> preserved, so keep treating the timeout as fatal.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA26216A22
	for <brcm80211@lists.linux.dev>; Thu,  7 Nov 2024 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730995790; cv=none; b=NLQuH/mjCokya35QUw6CGw/8FIbLHvloxJhkMn6o/s4bDQhwptUr8q0xB3Qjw3MoKcSSz3l6j4MiR5RuV+1JmY2fDs6HUOIIkQMh2UfTv5Eh+po2t+PU8y2fuaCe71gUcp7EkU00It7Lb13wYYj6ifjp2+0an8kRgY4D928ve3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730995790; c=relaxed/simple;
	bh=9uYl92ESq+nadkWJZNuYCmrQzUN+fm/5Hmarg7Tf1/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jP0JJqIQRYp7pDc3s+ZOZ4he7wlEfl30U5cF7/YMCwES3OMva8/oAth+p21cryUNvPt3QeJHx5iyYNRlim2qEc34W+AC0630d7u7wQHCP8C+ZCY6NZhpT0tZOjj8a5lpnlGvJfW5Ofp+bLHjAO6vSvTwBISms3WOHotzbDCAtGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkG+M7H+; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkG+M7H+"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5ebc1af9137so568222eaf.2
        for <brcm80211@lists.linux.dev>; Thu, 07 Nov 2024 08:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730995788; x=1731600588; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9uYl92ESq+nadkWJZNuYCmrQzUN+fm/5Hmarg7Tf1/c=;
        b=JkG+M7H+0A+HyhX/PR7UowtuJ10JbRLVOm5Yna4qMoJA8fK8RLDyC1FNg2NF23fV77
         DSeDXgZLZ0bvmmwmN8PDPtzU9/LoIETIYEEFA4VoiEv1tfXxVMpjtQWdoc0f6XjKu8L5
         5l2ReM3nT+SbRYtIUjAbLDO1lw5oVzGfehnovSS3hNpXtoTSCpZKmDX1iB3nyLo1g+5M
         y54krwrFLhehFX4C9oWmYmCuthKlKR+P7OSDI8VO9WhxptZMNZXnhGrW+pwgCasXnXMW
         eBajyaTbFrOAAYm6rrkUA8Nf84nnPPbtLK+OgbMLsoyYU6JK8kd2VK0fB9nZCpj0cvln
         JJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730995788; x=1731600588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uYl92ESq+nadkWJZNuYCmrQzUN+fm/5Hmarg7Tf1/c=;
        b=JGhszNBZS2nwQtnodNIoGVq+7yMReRMbep9Qm411o+DnK8iXX9mqSICcET6wq1mKkm
         IrzE1LOQ19sVqjtOQNL3K2EEMebXfPxsH7CkHMs6mWpjUY0T2qxqFjevmbD5bdrgaM0J
         6+XLmkAqgjtv2sf88U147hgmPqEztiH7itKxHcKlWnl8S3uOAv2LBk3ByHzmqOzMwE07
         bDkPBHpL+8CdCWOugHG6DUC7HHjJXiePOG3jyLFaXRZ0rB7qo10qkpXN2Jr9AHBDoaT6
         Qubqx9FrJPoKJSKsaacImm/IWILLeB878kzQpME0tqr0JN49U41mqMGspLRdhtdtiFg3
         7pOw==
X-Gm-Message-State: AOJu0YyvGkva7bwy3N3p5g4MV/ZQWMEkNvzwVYsG6hlUtcqnoomvocF2
	dcb6NKez9Fm0h5n3hJAn8hZZuP5sm3yJtJY3Gsfwqe6wAlmuEo8sRayObzmVxPbs3m7YGsuN6AP
	3psBmc+f9U3zPqZDxwVUygvWHizM=
X-Google-Smtp-Source: AGHT+IGQQIFZL+MrWbuYkkS7QZpc3zw9tWtjHqxeTsQBeP2mETzg4Sf07f4Ezu6h1CcSuzpKSFVcrRIxtftMCE+KO+M=
X-Received: by 2002:a05:6820:1b08:b0:5ba:ec8b:44b5 with SMTP id
 006d021491bc7-5ee56982567mr60610eaf.3.1730995787702; Thu, 07 Nov 2024
 08:09:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107132903.13513-1-nvbolhuis@gmail.com> <87ed3n5dxu.fsf@kernel.org>
In-Reply-To: <87ed3n5dxu.fsf@kernel.org>
From: N van Bolhuis <nvbolhuis@gmail.com>
Date: Thu, 7 Nov 2024 17:09:36 +0100
Message-ID: <CAP6rjy=gjbQg6hF4xzKZjabdtGVYijrPhn7zUHiw3ZHFJbQfWA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: brcmfmac: Fix oops due to NULL pointer
 dereference in 'brcmf_sdiod_sglist_rw'
To: Kalle Valo <kvalo@kernel.org>
Cc: brcm80211@lists.linux.dev, linux-wireless@vger.kernel.org, 
	arend.vanspriel@broadcom.com
Content-Type: text/plain; charset="UTF-8"

Op do 7 nov 2024 om 15:14 schreef Kalle Valo <kvalo@kernel.org>:
>
> nvbolhuis@gmail.com writes:
>
> > From: Norbert van Bolhuis <nvbolhuis@gmail.com>
> >
> > This patch fixes a NULL pointer dereference bug in brcmfmac that occurs
> > when a high 'sd_sgentry_align' value applies (e.g. 512) and a lot of queued SKBs
> > are sent from the pkt queue.
> >
> > The problem is the number of entries in the pre-allocated sgtable, it is
> > nents = max(rxglom_size, txglom_size) + max(rxglom_size, txglom_size) >> 4 + 1.
> > Given the default [rt]xglom_size=32 it's actually 35 which is too small.
> > Worst case, the pkt queue can end up with 64 SKBs. This occurs when a new SKB
> > is added for each original SKB if tailroom isn't enough to hold tail_pad.
> > At least one sg entry is needed for each SKB. So, eventually the "skb_queue_walk loop"
> > in brcmf_sdiod_sglist_rw may run out of sg entries. This makes sg_next return
> > NULL and this causes the oops.
> >
> > The patch sets nents to max(rxglom_size, txglom_size) * 2 to be able handle
> > the worst-case.
> > Btw. this requires only 64-35=29 * 16 (or 20 if CONFIG_NEED_SG_DMA_LENGTH) = 464
> > additional bytes of memory.
> >
> > Signed-off-by: Norbert van Bolhuis <nvbolhuis@gmail.com>
>
> What changed from v1? Please include a list of changes after '--' line,
> but no need to resend because of this.
>

Nothing changed, I just added the s-o-b.

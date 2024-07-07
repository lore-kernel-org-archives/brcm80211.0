Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48FD1E4A1
	for <brcm80211@lists.linux.dev>; Sun,  7 Jul 2024 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720363051; cv=none; b=pz6DnLeTPmWs0cRNpKFQUzA6YRS5CitJFcjUPjd56/Boy4bOI3CFUi6TKhucrDEcz5Lkd9JDdHdE669tyoWdU2EtyEGIRlxxgys6s4tLuV1rEJH6v9VZfTTZafV2lKcPXBDFgsWGk4Npglg5V3BUxmoW4YP70PP9KfbMsET0MNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720363051; c=relaxed/simple;
	bh=VTkCvo3YhgioEGHIgCLMSi8bVSonpg/26lt0OPh9hpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCG6EL+CxTWTY0k3HQRg1O36tf50tUUiwR8/gc4H89lCvmEkJyWdJAx+0Xv9JLV21RkK5qh0/0SvTD1cq2A1zNoo+zh3MGNJnUMteU9WHWCEU4PPWOYQSJvFyx/O6FKp+Ow9r68q2SMT1atjdUNozUMdPqH/Kbo01/gyQyf+xPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2v2gB7X; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2v2gB7X"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e036105251eso3097744276.0
        for <brcm80211@lists.linux.dev>; Sun, 07 Jul 2024 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720363049; x=1720967849; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Pxp1IsBUILn5BLy3fQz9IG9wBdWhD3Cm5CiHzVYaYc=;
        b=m2v2gB7XfPsKJ4mzHjy10J8S2641tpINuNgatTzHTxYe+0WdRbIAlPng6GRAb8S4Bf
         8sdl15P3Us3TurZqBUAljoocXbWUKHFbPTlv2aaG2eumn85dsV2sgMmnOrhBubvEA6uA
         qM2Ohal/nUOWHQpHpFwxT84O8AevQ1mSKxXsWXiIie0tyV2fjJNWNny5wIMdKbj+8Bn6
         Cu4mk/ghnykvMk4eXihaP6Eku2SKXubv10wCruOdLs4IGDUBUpw8+PeXWaVZSqgx100l
         n4NNJXsewDqNvtzw+iR5ANxSR5PJw1ztFI6xsnm9mm6/pzqFBjl85Mb6V05uy18EsCW4
         ZIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720363049; x=1720967849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Pxp1IsBUILn5BLy3fQz9IG9wBdWhD3Cm5CiHzVYaYc=;
        b=Mp9WDIdivLp07qzm+viBVGtU4gJCALUtaM5LzaJtLF4OjZWSThSmuiZHGAJuTMz1SS
         9DLLGYFd2u9L0eDGeDPaUp1V2t2tL0/OWr2HIsD9PBQxrztPC1FAhM3UhJtSea8CATGz
         1SM38kPDkp0Ngnin5ouEeJJ8nzSTNrBc1+QEJXvoBSsVJaXYjKwWtmDnr48FH6F8MnMt
         JiPFGTG0VSY7WICzhDc0wPjnJwdXBt5EkmhoRuZ8OBOY1TOhzlNXG4/jrM/j2ylVverI
         /sA6h02EuzNVJECPtJgomwyFiSCZCxc2W2T/7ChnVlmChHhqD+kFmNZhrWHwSLNy7xSF
         y5fA==
X-Forwarded-Encrypted: i=1; AJvYcCXEXJu8yF1jl6fZGsfFuTh1mgEOCPPT4I/TxfK/EGFe9uDc8vnWTAJLCPHyJoIHM44vq+bOKKhEG7mvajflvHpsWYvROYHDNcHz
X-Gm-Message-State: AOJu0Yy/6J411f1YnOQHWb6tv9COt7neJEvjWxhxvVqaNhOcc1tX7Q0w
	v0fXPgSlSl8X+dxd2vkcTVtbj6wGeI98Q6n3I0P0MG6MjxQjiXOUL8xLSxPWysTSPi2VcIjvR4b
	hxj1/H4jVl4G6btHhN6/rooe9bQw=
X-Google-Smtp-Source: AGHT+IH7tIgtha8tBep09OAG+9uYOWJ10PN+kfGMh5j6v0ZCeC5mrLHrvg1FubM49rvHNhzzA2L1rFQ9O+5C6T4ltMk=
X-Received: by 2002:a25:8746:0:b0:e03:5f4c:b591 with SMTP id
 3f1490d57ef6-e03c19dafaemr10596978276.49.1720363048875; Sun, 07 Jul 2024
 07:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1c6684f6-d3a8-4eaa-842d-c21fa2dd81c1@gmail.com> <1908d5acac0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <1908d5acac0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: Nikolay Nikolov <dobrev666@gmail.com>
Date: Sun, 7 Jul 2024 16:37:18 +0200
Message-ID: <CAHP5HDP_4NrZtQwcLRhj5efbnZiV=PNZcaeye3Gxx6pqFufyAg@mail.gmail.com>
Subject: Re: [PATCH 1/1] wifi: brcm80211: brcmfmac: Prevent sdio bus going to
 sleep while transfering data
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, nikolay.nikolov@bench.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I am really sorry for the spamming !
I have not sent a patch to the Linux kernel mailing list for more than
20 years and mail clients do not behave as I expect. My first email
was rejected from the mailing lists as it contained HTML. Indentation
is not correct in the second one. I hope third one is correct.
Just to make it clear this email I am using now is my private and
nikolay.nikolov@bench.com is my corporate.

I am involved in embedded development of a 1LV wifi module and we are
using highly patched driver from infineon:
https://github.com/Infineon/ifx-backports
And we have problems with this driver. I see some flags are used to
prevent a race conditions between brcmf_sdio_bus_watchdog() and
brcmf_sdio_dataworker()
Infineon added some debug messages:
WARN: Read operation when bus is in sleep state
WARN: Write operation when bus is in sleep state

These messages appear from time to time in our embedded system. It
turns out the flags used to prevent such condition are not enough -
dpc_running, dpc_triggered.
What happens in SMP system is watchdog thread checks these flags and
finds them set as false and proceeds to set the sdio bus to sleep.
Exactly at the same moment while watchdog is setting sdio bus mode to
sleep brcmf_sdio_dataworker is started, sets these flags to true and
continues to transmit data. Watchdog unaware of this as flags were
already checked sets the sdio bus to sleep. As dataworker continues to
work, it finds the sdio bus sleeping which is a problem.
We are using this patch at the moment and we do not experience this
issue anymore. I will also send the patch to Infineon next week. We
communicate through a reseller with them so it will take some time and
effort.

I hope I explained it good enough. If still not clear, please let me
know. I will try to explain it better if I have missed something
above.
I think using mutex makes at least dpc_running flag irrelevant and
could be removed. But for now I did not want to add more complexity in
my patch. If you agree I can try to remove it in a new patch.

Regards,
Nikolay Nikolov

On Sun, Jul 7, 2024 at 3:21=E2=80=AFPM Arend Van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On July 7, 2024 2:22:49 PM Nikolay Nikolov <dobrev666@gmail.com> wrote:
>
> > Use mutex to prevent sdio bus to be put to sleep by the sdio_bus_watchd=
og
> > while sdio dataworker handles sdio_dpc data transfers.
>
> Any reason for sending 3 identical patches within the hour.
>
> As to the patch itself I would like to know if there is a reported issue
> being fixed here. What is the motivation behind this patch. Looking at th=
e
> code I do not think the mutex is needed so please elaborate.
>
> Regards,
> Arend
>
> > Signed-off-by: Nikolay Nikolov <nikolay.nikolov@bench.com>
> > ---
> >  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
>
>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953522;
	b=demojPtJd6UHwRu/LhP2yr01ZEyrhZ2vNWU2yVCi1FuZRXUd1fE9eACYnChACtciyaAt
	 81q8A7EA8lx4CUVtHQXXvZUhI8FQYxFye1zGzgUSUtjxLeW8W56PYrHyBXUbvNwQa1deI
	 jRCKVtYpwWp0D8J2gNtYUPzmYaukyOnI6IfNFPd13XAN/LzeSVxl2lA2zagAT9K+BR7Wk
	 SjVKgt4aOttuOMaLUjTKSWW2m+TJVHdHp+Cr/ZM+c0iTyDoTsgECgJoq0LCL+1HgRJA1C
	 jS/9TzOkouOE8oYTcidGyGuphJKeTmHsqMDsjU5Zq2TdIMieQ9u4oP4VoC7UVi0jYhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=316xTB1Ic4KiZ/XptBkOoy8eoZa1ZVNxxinG6uDd+dc=;
	b=2ot47tTB1hqr7IMF0chxzLJGTbMfyRkMH589NGtc21yG/YH2q1aXzdE/oiRNjrLLXiU6
	 d4PDNjacAnCyK+uLNBCAknmUT4NZ1Wq5hnv0GfC8kTaCc/eAU/vLdn/ovZRmV62yBlp65
	 heuuWZx+ntPAL7OhHlTivOR0+D/iYSrJT7T+wJa22WwcvBlF0A4gm2LWX84mFnIEwoacb
	 JPLJ3sSQ5PfR1pZ/Rj6Dc4FQ7WLVwPPQjR49eBFYmmLsDWv24IsrDn8a5raI8GsZFR9HX
	 HnFpD0vI5xMqH3bImbt76H/1CVW6/3cJgEa/nFYHpsbd+es/uMOuJomI8pJWv41f+YQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GNtAI/yH";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED44606A31C
	for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 22:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED44606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNtAI/yH
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2eff29ca765so1212175ad.3
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 14:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953521; cv=none;
        d=google.com; s=arc-20260327;
        b=VjGVLZ8HsGvEKpHCpA/F4BSlVJcSxlSq7lDwobJSMJDRGj9BoUANo3J8N4G8g/4H2c
         Zah+i2RHzOlNSYqBLg0K3UtTQh2uZXiDuJT1hKLhj5q+p4wH+3nSWlEkDrUJkE2A7Ugl
         VlGZy6wxdSxbilBlhK5SO02R27WAXdGCis9CnoVr5+lazoyRxzKprUzN8YdkJNKIngXN
         K21Nuallj+F79tTPfslwtpnD62ZiZ1X9rN9Ix0h4kiDPzqf7la5H1PlrD9ApidCCkmPB
         sranPfhJJysJbSTvL99+XudoLsvwcya1SQskiLiHZlHEjEM6MypopUkfEj76XmJNsoBl
         JXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=316xTB1Ic4KiZ/XptBkOoy8eoZa1ZVNxxinG6uDd+dc=;
        fh=OjZYUH+OYfauD96BtvOI8Li3Z/BTKAiwn4NXzjgI1oQ=;
        b=Rf/lY5Ns52E+GVX9d+N/WG5aQCoXO8W1li9SAuX+v1JrJsnh6glgct3WnP96xFuglW
         +CLB6AN1wNa32c5rJ0Q1UjX3CFI5A3EacMCBsU40DMsJLMX6ib25aPfw8moBiFbni+Fe
         XHpasaXqV1+x5dieR49ffuh5WNySvRJGuxbK7Ry5S5xZ2fv0R/sXhOzW7snRumKY9CKC
         ln5xej3NTqy1Qs17WEwxo4+RGQt29JhHkWt5PYiTO/hHccWjW8YHBMV2RJV1Nc5N7x2f
         seZ3SaYszkEboVjEU9bMDA4OgRqb7hmRi0U9/AoIKAIEA7eyKWY9Nlas3qbvkXEPjVmM
         gnvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953521; x=1795558321; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=316xTB1Ic4KiZ/XptBkOoy8eoZa1ZVNxxinG6uDd+dc=;
        b=GNtAI/yHlbSfVo9B3sH95Ygkkv/5E/e6Km3jR8d9tiIdbHLA1VM4tV4sVFfN2EqCBa
         wqkmHaOISbsDmUrnivAxtgLnpDoen9sYKZEsSjGqBj+UEah208Ymz/kSOHie4Bkz3d/N
         vjcBBDp1L93jwLmzeUp6aTJcFoyAns1yDOB5R8gcptwiPwsVljkDYge09+9rpGleTWAI
         C9ywZZJif6xkMXZNPHBV3LR7uXlkUK2b7HuxOv2EK3KdnU3z6e/JMdP2HAEVeHVzHhlC
         /XZBmXPOHZdrLPtrmxWYig13GrkYIySBunDeZ0Ndvfn6GyLuJ3sWJCbn5yxxOv+xI4Sq
         TjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953521; x=1795558321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=316xTB1Ic4KiZ/XptBkOoy8eoZa1ZVNxxinG6uDd+dc=;
        b=TujiMSjMw/YaA74x5jc+Vs13YsCXKujbMfQo8+14z9KGJqUfOXrz0orbiRMpIQiPXe
         j2dCAvQMNsYamgfvMRszhvVZLnaVlHRqIHHbo+51migPPFkN1Y+UJiaLWmZkzXMAB/QF
         NfteQtp40qDfheaXwW7rBO9T1qM4d6s49+o7kmqtHIVw8TQdJwQT/Nt07fmIg5+SevwB
         ipLCmHarS0Bq7VP8q38F0sSvymUzEcUsOUIRqWGD22T0rSJ/DNrlGULegxGD+9Dp++Nu
         XH+sCMIvRDIPRkS21tbR423qEypEeqxVYR12RnYfzmL+1XRkBVNIfdxDqa5m/FmujfGu
         29NQ==
X-Forwarded-Encrypted: i=1; AL+hErHBwV0MOTwqJHCMI3lIhPwyqzVVYUK7MAMox1edSy66At8z6qcVbeEC49z61v1fNLrIx26Ugs3ZDuI=@lists.linux.dev
X-Gm-Message-State: APuU4Z+B0EATYOaZ4m6H43U/c7GaiNi3+enW1vAhn8rZgRPWRP9K4Wsu
	lihND6ikBLOsKCzjbVXRBppgkzQMbivzuFnXBhSmims3Q9mR6PzZnPHiKsloBAKDpvZZcZ+VYpR
	v6MIECeIOKm/ip1xICMTwj1/Gut8ibKo=
X-Gm-Gg: AZFdTZfQt0p26JYWZmekn4J581VutcRf/jkp1n1/dnLECgH8e9mT4MTGThRyJyJuLRI
	oPE06aQN8+FM2DYh4iIaD723DH5FMgJo1QMguiE8ty9jBacLDE6bArGFqRSChXC1EPu8t+KywFl
	1INZOy3dBooqIYh41TjdvfXPlFY+hqyQowAMxiEXkHKC1PdEJUYDeD7jTuj79YiMy+XFJlv/rL9
	1Ia2bAJWYfD9Sh0mSs7DjgtsLgWzyvYupSUyfc16z9CeNsQtSFhPT3LQjzS5YfkWIEPPwNwN6Xx
	5IX8GvE/Wu25rXCOuh40TarJRafhcZUXYZ8+KICcn2m5DVJVW5fd6+dTvcYfOFww0ayHT/a0yyk
	SSjjhOOGNCeTdmCOoqscKp5WgRfNJ+L6wH/jRbi0iOSVIYcl1PzbXU4SawkF8FLTrhso2qA==
X-Received: by 2002:a17:902:fd8d:b0:2ef:e20f:3edf with SMTP id
 d9443c01a7336-2eff7529705mr5827385ad.13.1794953520979; Tue, 17 Nov 2026
 14:12:00 -0800 (PST)
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112050816.2795512-1-ragulbaby@gmail.com> <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
In-Reply-To: <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
From: Ragul Balaji <ragulbaby@gmail.com>
Date: Tue, 17 Nov 2026 16:11:49 -0600
X-Gm-Features: AclHuK8fNwCXBJ6WwVXG2oDZIXOmCX9RXf9oRWA0fqinCW731GZtpgkb8AVaLd8
Message-ID: <CAJnRr=qQMOsqh0Y3yXwdFfHtztJAhCVbPKO+kLzCSgRjOrcytg@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcm80211: move the USB bootloader definitions to a
 shared header
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Ho Jie Feng <hjf3108@gmail.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:52=E2=80=AFAM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On Thu, 12 Nov 2026 13:08:15 +0800, Ragul Balaji wrote:
> > The Broadcom USB bootloader downloads firmware the same way for other
> > USB chips than the FullMAC ones of brcmfmac.  Move its commands, states=
,
> > firmware header and response layouts from brcmfmac's usb.c to a header
> > in the shared include directory, so that other drivers can use them.
> >
> > Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  .../net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 68 +-------------=
--
> >  .../broadcom/brcm80211/include/brcm_usb_rdl.h      | 78 ++++++++++++++=
++++++++
> >  2 files changed, 79 insertions(+), 67 deletions(-)
>
> [...]
>
> > +#ifndef      _BRCM_USB_RDL_H_
> > +#define      _BRCM_USB_RDL_H_
> > +
> > +#include <linux/types.h>
> > +
> > +#define BRCMF_POSTBOOT_ID            0xA123  /* ID to detect if dongle
> > +                                                has boot up */
> > +
> > +#define TRX_MAGIC            0x30524448      /* "HDR0" */
>
> [...]
>
> The move itself looks fine. Like the series "Move brcmsmac code into
> brcmutil in preparation for brcmbmac" (posted a few minutes later), it is
> part of the reorganization that has to go in before the brcmbmac driver
> is sent again, and nothing else in the tree uses this header yet. Keeping
> the brcmfmac and the brcmsmac parts as separate patches is fine, but
> please send them as one series with a common cover letter, so the shared
> pieces are reviewed together. Since the series then touches more than
> brcmsmac, rename it to something like "Reorganize brcm80211 code into

Thanks for the review and suggestions. I'll combine the brcmfmac and
brcmsmac changes into a single patch series with a common cover
letter, and update the series title as suggested.

> shared directories in preparation for brcmbmac". Can you clarify the
> additional sign-off from Ho Jie Feng? Did he co-author the patch or did
> you use his (earlier) work?

Regarding Ho Jie Feng's sign-off, this is my first time working on
this kind of contribution, and Jie Feng has been guiding me through
the process. We've worked on this together, including the
implementation, hardware setup, and review. His contributions have
been significant throughout the process, which is why I've included
his sign-off.

>
> Regards,
> Arend

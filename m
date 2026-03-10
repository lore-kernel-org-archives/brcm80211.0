Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28A32D9EF4
	for <brcm80211@lists.linux.dev>; Tue, 10 Mar 2026 01:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107241; cv=pass; b=s8nKYu26bpXSeQkXNx8NAp9ViQIblGNRUJDED4K5kRTULySHqgBAt5EAQztd1tQiOD5MIdVKt+sxdxM1L75qAbdiOVQGJwe/aoxL6UTDx5ebHx8XPYZ4MoIbe5nqWPLCNDaY2CfELqiZj/9kdMYyuNpubAY3zC3jbC91M9kPfiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107241; c=relaxed/simple;
	bh=NBlN5KyU0kHRd0EUy91TOrcNkPwjsWDsVfWWuChOLbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8AsjlEC0OywIKqkKAfJmhj9Vsp9kitvgq7amVkq4KTu9G34oY+j+8X9cXZZz/crbTpALwPyJHQ8rs+k1IALNKmV6McusFygnBD+8jRcvSuEcCt2lVvIIUDQI9R9KHiTRsV7tFKolWT0w7podQU6ijf7QXKLro66APC8KP1o504=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlXrfxT5; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlXrfxT5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so1478527366b.2
        for <brcm80211@lists.linux.dev>; Mon, 09 Mar 2026 18:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773107238; cv=none;
        d=google.com; s=arc-20240605;
        b=MBXI5u9QTZT5V1YbI4qZErstvDwW46OXlKg7jgir87XWDvmBA3jWOsHz/hLZDjaKaT
         n2d9NSO/mDjQjDdp68RVT9lwYkR+UZJJd1EJPGe+eXTf6UM1ZuD4T3GCDBnipOT2Dfvl
         cGt6LnW/7GbLqARZy/6WosotEqXIIhs2kZJIqIl/z0vWr4WYFuuQgOXHJFGODxBNRFA2
         IB4urF+9+n7sgyV4W4X9j8iVEgJguNTfxxxsy8Qk8IaUTKHjuVkSJ+8sEx/Dmtm0B3Iw
         tKP7Whv8kutnwdE9CY6f18ZlwueH8kxW/jSsMuX7sicq06UX01x9zlehp0OfPvxKSjqO
         X0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NBlN5KyU0kHRd0EUy91TOrcNkPwjsWDsVfWWuChOLbo=;
        fh=6cBQcPWi2Qt9ENdJOUvNH7N5L9WWpd+AFOfndBPNbxg=;
        b=U4L+fgm3P2eGdwYm7sjkjTW1F7PYpW9eUBBBLxDv3NIrXS/rvuWJUnQlsiWAPRhiFs
         e9VwNeAonNceqo0oMKgl1jLZ2tnTJicdunTdtK6hIsOiSYCF8KYoPR7sRR4sKgaKonwC
         2OyIO+dXhN0fcqXFx8YKWgYti3CgBDC6NofD7yW1uRA/EVyO6gkFA1QiMJUukPMBir6d
         ZcVflSIP00eBa4q3AIFLlP0qWha+msvgd8MZGzz/NRQ9eXWxqwD0Cw6NwMwKaQ8QBW7Q
         6dEo+s4GO4STfEvKyvPV0WdEr3QdOp2kWn9osU3VB42wg++8CKStesUl5jWucCaPoGT9
         uyiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773107238; x=1773712038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBlN5KyU0kHRd0EUy91TOrcNkPwjsWDsVfWWuChOLbo=;
        b=PlXrfxT5T45GmOn0V87lkv1QwSz88nUAMFcou/l2TzSXi185fkH9pYWL+YwYWUqvmF
         zXnJBXlEKTzuRh9ziRqujh2yWxV07G4cKQ3/VFpeRZHT4zLzWM1t0gro8XYcXURw7O2p
         CNlYop2w925BmKZ56AxKsNGQd3XdFarNdc+Obfn3m3IwqbJMqKzZXd3GJwlzUGIH4wV6
         QZgTPyizBbPUU0ogxtlJ1q81lz2mFoXmqT08nnzRmpxITnUzk4k/yFgA9Nz56SzWG2UU
         DQig7xehfGx6jRuIa+CN/wEpL+JphJQ1g6q/NcSkgpfE1d9QR5eqFk4upeVEqJYv6oVI
         Oiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773107238; x=1773712038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NBlN5KyU0kHRd0EUy91TOrcNkPwjsWDsVfWWuChOLbo=;
        b=UITqMsaAyMDL6lCnGUji5dHRicIpdYPo1MdN360+vVUYm5SuivN3Tmtl7BEWeGlGM+
         vbehGB8jzYwFAGzW2J+Iyj10QHFsozlEIrDM19G1AGyA4AE5PuK9tbA5KKUmKWknquWH
         o6PFYRYKnEjs2rLc0qtmRC73YUcumCTRwxhoFXr3CpS2wClFuooBuR6mt3QCqTYfgtrp
         +gjTbkrpO/TSuCz0jVvaVZAlDoS5IX/8emq0B8VYDeVB8/SqWvj+5UlYq0hNCV5YnwF+
         DnOzAB0L2KoOP/LT8U0CDJ0NxNda5ioq6RKU3ajera1L0q63+CS/XHLpZU24mbyn8EUL
         DAUw==
X-Forwarded-Encrypted: i=1; AJvYcCWDtUdCF1yt8EWz0qpQPwSkOPKuARTE2ND50QUTpmrUm8h5i88MNXbMuWiAPy6BWOu6KPlTgv4wOD8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxdEKYcUtEDpa96CLqzQ85HbAZF47hTWUW+MEEhsTPgDN1+FDg
	FOtE7Py7VQPTT/wWtmiTwWHJbRX0iBeIaO33VYSRWAoR60N7vdK//M9Y4723zMLfqC1uv5wgQFn
	ViKc07mKpx8m+VHikhicZHX4HXMh3Q3w=
X-Gm-Gg: ATEYQzzP8XZHqcSMsZ/NNqHKZmQI9ct/miZrjf+Z+QWPY4Y11/K+Jqmnay+X4unGSt+
	vverYa0HSJJQ0pbOLk/ddVLIbNtjDLhaT9PPErziRezJFjUhX789dKwnkcK9bnB7zvpXtgjWve6
	Sonrf4mK1Bu9QWh7g7lgf+PEEAYd5JPP4jh6/VOChi4K/Gq5khycDFZTE+rsFK1zKmU2oJKVDKy
	jgDbNooOtSdxTX2Vs8JarZhw79ep9Li8boMRqJBlcuW0W3f1b7RDMFmbv0iXnjqwC+CU0jUO6Jj
	8PM8mCefrkyjUgOKbDRMOI/ELfLvqnlcGRfi67EVW2Y1j+wgFIPjaZJlpmy9x5nXMTmRKD3PT6Y
	7h7N8kA==
X-Received: by 2002:a17:907:1c9d:b0:b8f:79bc:b0d3 with SMTP id
 a640c23a62f3a-b942df82589mr725605566b.37.1773107237626; Mon, 09 Mar 2026
 18:47:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309215907.5789-1-rosenp@gmail.com> <CAGRGNgUsVxecZobcXvVwmaHD+QHmzp4qTPGSLOpJb6Uinrpa+w@mail.gmail.com>
In-Reply-To: <CAGRGNgUsVxecZobcXvVwmaHD+QHmzp4qTPGSLOpJb6Uinrpa+w@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 9 Mar 2026 18:47:06 -0700
X-Gm-Features: AaiRm51zrgLQDKQia7UXn_pjjoGPF9vlpqAXxflLJWQ092NFPl7NmMqXjcYFJ_o
Message-ID: <CAKxU2N_i3d2Bkx-35k7COtQ15UATVJja9wrHb8Pp8x9gDnpnBA@mail.gmail.com>
Subject: Re: [PATCHv2 wireless-next] wifi: brcmsmac: use FAM for debug code
To: Julian Calaby <julian.calaby@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, linux-wireless@vger.kernel.org, 
	"open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS" <brcm80211@lists.linux.dev>, 
	"open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS" <brcm80211-dev-list.pdl@broadcom.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 6:11=E2=80=AFPM Julian Calaby <julian.calaby@gmail.c=
om> wrote:
>
> Hi Arend,
>
> On Tue, Mar 10, 2026 at 8:59=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wr=
ote:
> >
> > Debug code requires a separate allocation to duplicate a string. A FAM
> > allows properly sized allocation with a single kfree.
>
> Sorry Rosen for hijacking your patch here.
>
> With these changes, does allocating and copying the string really need
> to be behind a DEBUG ifdef?
I don't know. I didn't write this code.
>
> The allocation, copying and freeing of the memory isn't in a hot path,
> so allocating/freeing a couple more bytes shouldn't matter that much,
> which only leaves the memory footprint, which appears to be less than
> 10 bytes.
>
> Thanks,
>
> --
> Julian Calaby
>
> Email: julian.calaby@gmail.com
> Profile: http://www.google.com/profiles/julian.calaby/

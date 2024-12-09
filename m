Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BB285C5E
	for <brcm80211@lists.linux.dev>; Mon,  9 Dec 2024 21:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733778512; cv=none; b=DSnuApvATyjIzNLf3ui7z4qXx5J6pjkxchX4C+PGUjskRzpw6MJ45X2eddvThG+wH2L4GNpNk6o4X7xgrfZt9lBG9TyuG88lnCHG89uhFnpGTUhnsaHasty/8V+vAaYv74xsxojTaIoh3yMuD+1miyBv+sIaECY+utkaYtaeZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733778512; c=relaxed/simple;
	bh=INrlLq8aQWxUFnTxFCwCdW0I/rDBC/T3SLuLP6j/PLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFohzJdyesWHShNSZpEDkL9tF87iRrl+y5oG1G7IhKlXK/7y3nLtCBtLGaKvPsVkYOl6TIUbGQ+u1CB7qM7RNNn9O8FiNXcnFB9UbLDGX+qzmxhHUeb8BARRAoNzobyZ9yAhz+URpv/I1YRY00Dh+9bS5RztMR6H3RowNAQu8H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxpJUjCN; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxpJUjCN"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29e70c9dc72so2576821fac.0
        for <brcm80211@lists.linux.dev>; Mon, 09 Dec 2024 13:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733778510; x=1734383310; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INrlLq8aQWxUFnTxFCwCdW0I/rDBC/T3SLuLP6j/PLg=;
        b=jxpJUjCNvK3f/BKLM8yLNHvffJWmNUo/QsRXGzSK5CAeXpC8WKJhoyqO0rfV4zuN9O
         K0HIIAYNc3yAlcXXAZKkJYcVTPFIOPO6uuJVeLlKP8AKMBtyaeMQ4U6zvpaIb+YAzOGQ
         vfZDC75te5B+ubH1cML+XilRiChX/buMaIEw1VIKXb1J9zGenIkuY2esgtBaDyGDY0Xh
         Cf36mJ5TMULm9nI6PqHB+ChZgZfNMFaFETOgm7VHw2gvsnL/EIzurr3jMuaLeVAjOjry
         ymdMxsVdTcmOpKbMvzWcwputucpSE5kwhbw7KGVu7eGJ8/Iwa7lduQaBYO0tsMml16Zn
         C23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733778510; x=1734383310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INrlLq8aQWxUFnTxFCwCdW0I/rDBC/T3SLuLP6j/PLg=;
        b=FHESx/uPuddf8k/LBltjSAwo4A7MxF/JAQIY6Rhk6QpwiAbLEQNt5o7bihp2Sfi5xn
         4rote5woPFPmNunbN4ZANDSqLTUypA1nPGkvcSKS25Omz3LV7QwK68a45ZLA1Ji4/mRK
         Ey+F+itSlDs1ZI2SfaiWQYtS7ExXm/rLQjgJNhh7Wuq4PN3MzcbGpQyAeXEKb0sao7Mj
         lxF3Ao/vsVwGzRVpPT+7akYDHr0bVBqgM+rCZ+DIQlAvJ4GrSqtEytsT72ptHhyhRjHn
         HgyZHMTn86eQWBe/jtafwyGT0pK0dKv3SlJorqV0+XjGR6/zf3rk5p6EvtDTLftgMPwJ
         F9pA==
X-Forwarded-Encrypted: i=1; AJvYcCWCQf2Nok6D7/VfoHz9Dukm4+XGRWqhVfmXsxCFHrloSs3cs0s0/nbNtUGmZQheZ1F+7BEljFhpMRQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxecMyygz0Bk5Ea7J2i3kuUibaDcjTuNHPZ3/TBl6llcTzeJgEg
	FYRJxc24NyXz5Fcq4dCgumwfXOk1ZzpraiZBwLbMxK1lx8xkcvX0vOI6ohZtlAmWWyEgzmwNn2Y
	tf2Q4cO8pYSPDLv94Z+unc5gxJNo=
X-Gm-Gg: ASbGnctY2JjIqfjF6x1t1PrgNKYbUnJNsfYfDb0OqdauCyFmLU7S34nqDTKLX3lh6Nw
	U9dLCAoez2bg428xjKt6esWR5DD17wEewEA==
X-Google-Smtp-Source: AGHT+IEJicYcFoJbXg/NqQFRKqB25/wqRz8C91cCA0J8LdvL5RJJBcGvh2aBRKQwxJC6xjwQPl344SOvQ9bb+4cBRIs=
X-Received: by 2002:a05:6870:fb93:b0:29e:1325:760a with SMTP id
 586e51a60fabf-29fee5519c3mr1218737fac.8.1733778509948; Mon, 09 Dec 2024
 13:08:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241122210346.2848578-1-alexthreed@gmail.com> <980c5cee-2dc3-4d26-b749-6ba00b9c2091@broadcom.com>
In-Reply-To: <980c5cee-2dc3-4d26-b749-6ba00b9c2091@broadcom.com>
From: Alex Shumsky <alexthreed@gmail.com>
Date: Tue, 10 Dec 2024 00:08:19 +0300
Message-ID: <CAF4oh-Np5HZzdCxjycrvr_-RS0ZdC4Y3AyCi89=Lo1gQnSSowg@mail.gmail.com>
Subject: Re: [PATCH] brcmfmac: fix RSSI report in AP mode
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, Alexey Berezhok <a@bayrepo.ru>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Kalle Valo <kvalo@kernel.org>, 
	Kees Cook <kees@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, brcm80211-dev-list.pdl@broadcom.com, 
	brcm80211@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 2:13=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 11/22/2024 10:03 PM, Alex Shumsky wrote:
> > After commit 9a1590934d9a ("brcmfmac: correctly report average RSSI in
> > station info") it is required from firmware to provide rx_lastpkt_rssi.
> > If this field is not provided brcmfmac doesn't report any RSSI at all.
> > Unfortunately some firmwares doesn't provide it. One example is firmwar=
e
> > for BCM43455 found in Raspbberry Pi.
> > See https://github.com/raspberrypi/linux/issues/4574
> >
> > Fix it by falling back to rssi field if rx_lastpkt_rssi is not provided
> > (like it was before 9a1590934d9a).
>
> Sounds like a reasonable approach. However, I would like to learn more
> about the issue. Maybe it is a per-vendor issue so I am interested what
> the sta_info version is that we get from firmware. It is printed in
> brcmf_cfg80211_get_station() with brcmf_dbg(). You can make it a
> bphy_err() call instead or enable TRACE level debug messages in the drive=
r.
>
> Also would be good to know the firmware version and kernel version of
> the BCM43455.
>
> Regards,
> Arend

I've just checked sta version in trace logs:
brcmf_cfg80211_get_station version 4

Firmware I currently use:
BCM4345/6 wl0: Aug 29 2023 01:47:08 version 7.45.265 (28bca26 CY) FWID
01-b677b91b
https://github.com/murata-wireless/cyw-fmac-fw/blob/e024d0c0a3ab241f547cb44=
303de7e1b49f0ca78/cyfmac43455-sdio.bin

I'm not sure what firmware version is used in the raspberry pi distro.
From raspberry forums it looks, like:
Firmware: BCM4345/6 wl0: Nov 1 2021 00:37:25 version 7.45.241 (1a2f2fa
CY) FWID 01-703fd60

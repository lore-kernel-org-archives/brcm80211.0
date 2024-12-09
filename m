Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B310946B8
	for <brcm80211@lists.linux.dev>; Mon,  9 Dec 2024 21:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733780595; cv=none; b=IjKSg5wkYoU8LhuH0RfuqRADFJ/rZR0P/+tdCqHyCUS3qLJx7wMUt5QcnjZimX3GszbaLjMBCTs3Kv91Wp7HuEY4q3Mz3/fYm5v/u+ODbfl3l9iIN/XZbtkEjw457dSygsFiX8bZ/4/WZBkBQaUJ+DIklcaFb4JdWgYkQyphBGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733780595; c=relaxed/simple;
	bh=7C3TIQDc5r9whWF7hD8ixXiUW5KVhkJSPaWd2XPJqUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lE/NqCRrwt5XdkK8tjs50c3kiDXnERCOmeb1NpaY06lqdzA03cQpxpnBeRiXgAjlvMSSdT7SUSRqmAjpNQgq5r1sC9CE2dk4Uq6Fg0J/AKlnkwdceh5AjnOQDvcAAtHsIZtiBCDDqlGMVqt/Nw+HFmhoqk8DmmA1ac046mcAk+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6c+pUT4; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6c+pUT4"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee6dd1dd5eso3864213a91.3
        for <brcm80211@lists.linux.dev>; Mon, 09 Dec 2024 13:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733780593; x=1734385393; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7C3TIQDc5r9whWF7hD8ixXiUW5KVhkJSPaWd2XPJqUQ=;
        b=O6c+pUT4mbMFJAh0SROB6oA4FuNG37jymRMHyDBpbnvNz5+HFWxL0I0cZoeHpG/VK9
         /Rv9vi8XgoVXgcz0JPRumFIFwlHszWRE2ip1S/KGSYK/O6VE1hfB1ZR/rdGxWj2f7ytC
         J/bHGY5JFYOyBlHCn6qdwcy7Ot9MNg/tDu4EUL0VsXapvKiF9IIjX5vifC/sNXVrLvC0
         MYPdH73Chaw3eq0PvRLNAMcQii9UaSQy/aib9N0BvSnpqJZJo+eDKJ7hlhl99MLpiVTX
         FjECN35KyRMTwMBbL6hnVR2Y1VvJQ8nUpg4asQG8GiWNPzWcGJOIEPRaPmxfHFJN1uiZ
         IS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733780593; x=1734385393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7C3TIQDc5r9whWF7hD8ixXiUW5KVhkJSPaWd2XPJqUQ=;
        b=r3AcjGy3qpocCdlzKSf3GkU+zqh1BTbvfWKFNoy/UmSmZgve+lt+pJbBcDpTnY6ZOT
         qlk+/yFYxhhTWZ1LbgR+1zLzVeu6Mb71RAupEuPgdfwv1LYOMjcBqmVwP0A9LdgGo8tb
         8es0ZfYK/zj8Tc1krlarlLDo/m18RPKGXJbkQnAH8gInUKCAp9ATCJxJ2SbbWBKRzD6d
         7gfJkRsWC2mH3bDXUMnCWoVUAta3QKMmXHfjhTbBD7txsoS7YWwb+r5pIL9hFYbJ7Vod
         MysVLD+2d5h61nyECP55QdzpxhTCuyqdvuFv1ElsR2krtjseaj3O0WJ2l0IdSuyKsQ5D
         +tPA==
X-Forwarded-Encrypted: i=1; AJvYcCXnAPY4kCxzO28z6d4wX/40lTFKoiK0Wx/8gXEYMVug/TZzeEM43+l0YtpGLvNBNOUeB4J4MSeFLyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/xCV+9f7pCy/btABBkVPONDtGu6r3sPXEr9TwdpZ4MrHK4Wu2
	d/IqDQptmJhORjqy79qWk53s6nH/5nbrELk3TNVApXLAdD96ti3kpaU0o/TzXapPHIzHutYsrfW
	MV1quQtzZr7DAATDQzACpx818bMaJS43P9+g=
X-Gm-Gg: ASbGnctRDo90v9Ru4R8d+v/JHs77MXGR0qq3gQ8UiCJNWPPjMYHOcDbkoJOvhQzv7uo
	ls2+t6Z1jA1qrdD7kEw0tcdAs7wduti56/WBLtg==
X-Google-Smtp-Source: AGHT+IFHl9JvnbZ+WzyQTTMG8AYlwn35BnR5qXXNW5glTv8INdg01gjaC0AsvGoTptYUEGv3VkWRbRqYbYwgJy28coc=
X-Received: by 2002:a17:90b:394f:b0:2ee:aed2:c15c with SMTP id
 98e67ed59e1d1-2efcf25d4b4mr2723757a91.28.1733780592965; Mon, 09 Dec 2024
 13:43:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241122210346.2848578-1-alexthreed@gmail.com>
 <980c5cee-2dc3-4d26-b749-6ba00b9c2091@broadcom.com> <CAF4oh-Np5HZzdCxjycrvr_-RS0ZdC4Y3AyCi89=Lo1gQnSSowg@mail.gmail.com>
In-Reply-To: <CAF4oh-Np5HZzdCxjycrvr_-RS0ZdC4Y3AyCi89=Lo1gQnSSowg@mail.gmail.com>
From: KeithG <ys3al35l@gmail.com>
Date: Mon, 9 Dec 2024 15:43:01 -0600
Message-ID: <CAG17S_MYhPCuDryf2Meh64iZPAc-NnHyPwEv4oQdww9QNr0j6g@mail.gmail.com>
Subject: Re: [PATCH] brcmfmac: fix RSSI report in AP mode
To: Alex Shumsky <alexthreed@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, linux-wireless@vger.kernel.org, 
	Alexey Berezhok <a@bayrepo.ru>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Kalle Valo <kvalo@kernel.org>, 
	Kees Cook <kees@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, brcm80211-dev-list.pdl@broadcom.com, 
	brcm80211@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From my updated aarch64 RPiOS Bookworm as of today, it is:
Firmware: BCM4345/6 wl0: Aug 29 2023 01:47:08 version 7.45.265 (28bca26
CY) FWID 01-b677b91b

On Mon, Dec 9, 2024 at 3:08=E2=80=AFPM Alex Shumsky <alexthreed@gmail.com> =
wrote:
>
> On Tue, Nov 26, 2024 at 2:13=E2=80=AFPM Arend van Spriel
> <arend.vanspriel@broadcom.com> wrote:
> >
> > On 11/22/2024 10:03 PM, Alex Shumsky wrote:
> > > After commit 9a1590934d9a ("brcmfmac: correctly report average RSSI i=
n
> > > station info") it is required from firmware to provide rx_lastpkt_rss=
i.
> > > If this field is not provided brcmfmac doesn't report any RSSI at all=
.
> > > Unfortunately some firmwares doesn't provide it. One example is firmw=
are
> > > for BCM43455 found in Raspbberry Pi.
> > > See https://github.com/raspberrypi/linux/issues/4574
> > >
> > > Fix it by falling back to rssi field if rx_lastpkt_rssi is not provid=
ed
> > > (like it was before 9a1590934d9a).
> >
> > Sounds like a reasonable approach. However, I would like to learn more
> > about the issue. Maybe it is a per-vendor issue so I am interested what
> > the sta_info version is that we get from firmware. It is printed in
> > brcmf_cfg80211_get_station() with brcmf_dbg(). You can make it a
> > bphy_err() call instead or enable TRACE level debug messages in the dri=
ver.
> >
> > Also would be good to know the firmware version and kernel version of
> > the BCM43455.
> >
> > Regards,
> > Arend
>
> I've just checked sta version in trace logs:
> brcmf_cfg80211_get_station version 4
>
> Firmware I currently use:
> BCM4345/6 wl0: Aug 29 2023 01:47:08 version 7.45.265 (28bca26 CY) FWID
> 01-b677b91b
> https://github.com/murata-wireless/cyw-fmac-fw/blob/e024d0c0a3ab241f547cb=
44303de7e1b49f0ca78/cyfmac43455-sdio.bin
>
> I'm not sure what firmware version is used in the raspberry pi distro.
> From raspberry forums it looks, like:
> Firmware: BCM4345/6 wl0: Nov 1 2021 00:37:25 version 7.45.241 (1a2f2fa
> CY) FWID 01-703fd60
>

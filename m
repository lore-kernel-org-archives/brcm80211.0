Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F85218FC8F
	for <brcm80211@lists.linux.dev>; Sun, 15 Dec 2024 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734278893; cv=none; b=GtEb4lXfFfDJfZSZAKynsZU6JJ+EPv2bZJLxVIwZeyamLCmol9Gm1MN/sifDQKAVc/PHdcOBrha5Mx38ybUFVxLjZThWfidjWLHwu4bGVmu3CLOomHRCBFRWuCjtjjOkIfjTWeumSbLjnaaznrrezcIfgVTmdXTeAu7CM2DYjck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734278893; c=relaxed/simple;
	bh=P5Z2L2NR4Zwptsivm7F+CjfdqcynPJts4uC3SxS9hMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COXgH9OdiGNPcp0RzxXcYqj765Jj54LagLK2tG2YrFadH5mB3kLm7poSIASZw05aYvIG/ph/RB2Of5qenPxo+cMVwju3w+hC6gmtT/TY/YvKdP9ardViBNsX7uQqHOupskrdBZ5OXNQPQJUuOlt8DrURjQCWNFuW5e0OmHvwVC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Au9RA01r; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Au9RA01r"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so2489702a12.1
        for <brcm80211@lists.linux.dev>; Sun, 15 Dec 2024 08:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734278891; x=1734883691; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5Z2L2NR4Zwptsivm7F+CjfdqcynPJts4uC3SxS9hMQ=;
        b=Au9RA01r3uSELEGjNvS9LjrkKf4HZ2BwrjEQ6gDhREeUvHIHlwCwRYzcxtcrCze4OY
         rW/Lp974oXpVRG0LyrWxuC6VgbBky49hTsJVoIY0+Ld/adf4nlpRQdwUqryJidKOMs3C
         rbGU86j1+ERMuHHVMOnbpbSZD6EjalkE9EXrR42/omqptjTLSw7SIuL1EKqrWe4xAyt4
         sx0ckpG1QVqniMNtqxPxBnwoD8y1fuMJ73wZw+2EbqLrtAO0b/1jWFz+dgbm9m86dn6b
         he2pHmzkUJyMmGMrhRz4rWtNxMgbaEsvFyC8bb5uZiIzbsjkT3Lhvw/shPDTft8vQVd4
         lM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734278891; x=1734883691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5Z2L2NR4Zwptsivm7F+CjfdqcynPJts4uC3SxS9hMQ=;
        b=RRLblvdA/lWvmv+qLtmsrUVRlqFGUlbXg6BAK5gkKIe6EjYaQf3g2HA4SuOqPZZORB
         mlZkCzJZ/85wgjP7yaJPnkA6YXWH+EFsMokelacCjw6NivEJ+97QzyQo+7wrGxvvUP3s
         n0RGv+wIlTM2oebLUIznFf7AlH3B0pHvUFECz/0qCySh7kcUkQy5hPg25abiHk9pe58y
         NTUAkH3BJVg7fOLYwTERrj+Qd4SmIMbvMnf967trVaCBE3ZGB69atuVeEp/WMRbNTqGp
         JT4xkZXPVktNaNiBbAlq5yTDYWqetnwXMJ37Dn8D0Pwpr95gVzz6xrWsDzNVquWZ3vqM
         0VSw==
X-Gm-Message-State: AOJu0Yw/Ov6USqhNuhg9qPrGkCKLWK/6NngKiuedi4lmvIANAlM8t/bZ
	tak/rTX9H6BesdbPhKO4sVRU//cdjt41m73Y37nDRZDUZne3QH65B+Z4haZpTnmIRrdi8danKNI
	CSnbtenIUpSbS6Oe7ziERU+hCECLEEA==
X-Gm-Gg: ASbGnctKys2Uwt+bU9db6NOhvhq9nczC+EeBz6miMj+I0+Idrfwp075mSzBjNoQ7pm2
	DvplQmVMpCA3+qUG4OtbHze02bqhdMP8+1p+iSGTmjwuv5wQI7ncysMleUeUDFUluDEbjib6/
X-Google-Smtp-Source: AGHT+IGF0zGrZtfVbdv0yvQXYaTe/OWsxjuqyTxCboomBSvdCzuDV7eWTq52L/Ihe6HEL4ueuwNK/n6m0vl9KbzHpgQ=
X-Received: by 2002:a17:90b:2e4c:b0:2f2:a9f0:40b0 with SMTP id
 98e67ed59e1d1-2f2a9f0589bmr5782882a91.23.1734278891428; Sun, 15 Dec 2024
 08:08:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG17S_OwtNxetb7XzsxkZcygH_CWkZx15evQZkThb3WjqpiKTQ@mail.gmail.com>
 <CAG17S_M9wxMsSNyqAQv2oxaCQZ9CAe=GHNjZCbw__2bsAg1hdg@mail.gmail.com>
 <ff9c1192-42b5-4a28-a8c9-31af9765cbff@broadcom.com> <CAG17S_PrigpkFP=5wcTL9UETwc6aHqXnuTEyeRrZ7Ey1cb-ZLw@mail.gmail.com>
 <193c1173968.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAG17S_NwSKEJzbk7RNiOKqU_25f6muydbh0DN+ec1Ke6QrR1Qw@mail.gmail.com>
 <CAG17S_NqbLogvTWyoYobZ6kOpfXHnScfm4-dB1EqsmpB+q+zxA@mail.gmail.com> <21a81894-2e1e-440b-b7ea-27660fa08d9d@broadcom.com>
In-Reply-To: <21a81894-2e1e-440b-b7ea-27660fa08d9d@broadcom.com>
From: KeithG <ys3al35l@gmail.com>
Date: Sun, 15 Dec 2024 10:08:00 -0600
Message-ID: <CAG17S_O5K4Uh2c6xqph5sUZe8gMjhD3z4FDkSSQ0dhCuZA6aug@mail.gmail.com>
Subject: Re: brcmfmac SAE/WPA3 negotiation
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: brcm80211@lists.linux.dev, linux-wireless@vger.kernel.org, 
	Denis Kenzior <denkenz@gmail.com>, James Prestwood <prestwoj@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2024 at 6:12=E2=80=AFAM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 12/14/2024 2:34 PM, KeithG wrote:
> > Arend,
> >
> > I looked through the info where I got the latest firmware:
> > https://community.infineon.com/t5/Wi-Fi-Bluetooth-for-Linux/Wi-Fi-A-cla=
ss-Linux-Driver-release-FMAC-2024-11-21-Documents/td-p/905045
> > https://community.infineon.com/t5/AIROC-Wi-Fi-and-Wi-Fi-Bluetooth/Cypre=
ss-Linux-WiFi-Driver-Release-FMAC-2024-11-21/td-p/902888
> > and did not find anything, but I really do not know what I am looking f=
or.
>
> I think I had a bit more luck and maybe found the needle. I sent out
> another RFT patch which hopefully gets rid of the BCME_BADLEN error.
>
> Regards,
> Arend
Arend,

Can you send me a link to that patch? I want to try it.

Keith

Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1AD1A8F89
	for <brcm80211@lists.linux.dev>; Fri, 13 Dec 2024 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734078966; cv=none; b=GWTyyIc4Wi+eF8RhwJP+lyXIRCr6kbdUTjKE+ec/mKA1eh31o10LGf2W0zqBroF9cDHqWA7t6fp9Sexm9hbzC7nStgD7/iD9nyzezuHLoZVZrbIBBN45gnTFqyA0R8AUc/dtTPQ09H4ACvVeXG5dBvFkr+aWDPJSI/3hzPwG5Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734078966; c=relaxed/simple;
	bh=cwDAQSL6vuttS2U979Dz48haJPwu372rR4K4KD1V+60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HP5yijdPpYgvHRk/Y5XaQe//1ngDPDylpGfhR/ixghuJ/9IPcu0cQQoOW6uDB2dbC8HBR3hPLaOgosKo7PWXVaQUKyHgyAS8ONvRZUyA+gGSf08ZUpNxpMTl3dgo7hpueEAr0eHueIszmqVgGtBcnqyxJstkoh57dpFgBdSUTtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/sHOTP/; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/sHOTP/"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2a3c075ddb6so22043fac.2
        for <brcm80211@lists.linux.dev>; Fri, 13 Dec 2024 00:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734078964; x=1734683764; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4mjN3RvlXaIu4Z7K4aTVENMghR+huMJZIDwJoq1+Bg=;
        b=H/sHOTP/nBR6nUoJnpgL4K1R2rtxAe+HzxNv5pNWsDYKSzeSQzyQvopoYPMfEX8jjR
         KeaxbRhPQFmb/smHcxCcOvZwXoBTV3woQxMvYHCvPek2F9nKMT9l1d8BhKY7YJZ+2J/c
         HEWdrtvufBAZRzEyTKeYc6D3/PKAxt25q3vsXtNwFhgczDE8MRM5MfdykVP7AsUgGOWj
         9h8CoVc2e/JTH3yAJg+l2tOs4RcImou1Ck9w4+vPKOGLjMonH+oevdEg4yN+W918g8wT
         V3Qwqd98j70CvIrRNr8SU+fGR72J/+YQCUmtyvtFESJW9fSXbYC6t0lmQhlPRCrTUzYG
         1JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734078964; x=1734683764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4mjN3RvlXaIu4Z7K4aTVENMghR+huMJZIDwJoq1+Bg=;
        b=KbwFB2MI/O/z4J3niO+wLLURdoe0Mb7PZQjaBBsughDbFKYRYV/8zFURyh73vJ5NXJ
         DlFgjgWJKOrqpJUibQIjs3Fo6NtVciZIFNUJvP5GcYt/r//c3a16UlKnYQOmHPYuVpgN
         crBsvc1JmWxCujR5jD666WXMMIa9OAPNiuzwvYUsRmOsO/s5B0ppw9pst22lINkt+uOo
         /Chfl1atE35wWQRWWvi0eYtFS2R9RGMKevpkx+8I2RQqhTzR2lWPE1kiEwixzSiG8wzp
         KjMy5G0B6neWyADIsc7KYkh2nz+J6NwbLvQ00/VtOsy0XUfEPLD9d5Fe2hxw4HNvq0Zl
         MMzw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Le5h7F/dtUb/E7vBHKp30b4U4VbIFGvmYyy+mQZ2+FhpKCFXqtPwI5RwjF57hXbMJ6q1s0RAo6Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfVAVXeGBVh5dPh1lsYAmMzm/Seo/ChZ/JvMZ7qjqISex0ZYsn
	kpM4TY5TSlu4TCO2mmm37Qo8mqaa06pfqvPpc4fWy4boLxIjqFiIl8JYFibUJFubiawDVjUUAoo
	jrIjUo6QdFwx7Kjc8BlAHzLvX5zE=
X-Gm-Gg: ASbGnctsW8UrCgwhZf5EC6FVxX7hjwX6c+BGU9/Cq532nWn37IMx9KhyLnx5ETZr4Td
	jA2c9bBtk5/bI/wO/7ftjBgOz8znoLsAYl6uv
X-Google-Smtp-Source: AGHT+IEjGqxi8FLoj8CpGN2+LUvhxpaV3aY/lsPFS2q6djXX+/0dDgyAdcTFPpNQeTOP7455einSNxdeVpg/wUeZCdU=
X-Received: by 2002:a05:6870:3c08:b0:284:ff51:58ad with SMTP id
 586e51a60fabf-2a3ac8b7939mr1173933fac.27.1734078963999; Fri, 13 Dec 2024
 00:36:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241122180435.1637479-1-alexthreed@gmail.com>
 <be2f054e-5ff8-4fcb-ad50-0dc0d5c03bf5@broadcom.com> <CAF4oh-NtqAX6gqz3DnLes6oR3RhZyOEvSfOk=rPPPm=1XzGAWQ@mail.gmail.com>
 <7c85313c-58e2-4bff-a525-a40f8aadcab9@broadcom.com>
In-Reply-To: <7c85313c-58e2-4bff-a525-a40f8aadcab9@broadcom.com>
From: Alex Shumsky <alexthreed@gmail.com>
Date: Fri, 13 Dec 2024 11:35:53 +0300
Message-ID: <CAF4oh-MufW98ooTQstJFRF1222hNyOdaCVUaLMpYsRzqo6FGZg@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: remove misleading log messages
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, 
	Kalle Valo <kvalo@kernel.org>, brcm80211-dev-list.pdl@broadcom.com, 
	brcm80211@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 12:30=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 12/9/2024 9:08 PM, Alex Shumsky wrote:
> > On Tue, Nov 26, 2024 at 2:02=E2=80=AFPM Arend van Spriel
> > <arend.vanspriel@broadcom.com> wrote:
> >>
> >> On 11/22/2024 7:04 PM, Alex Shumsky wrote:
> >>> Currently when debug info enabled, dmesg spammed every few minutes wi=
th
> >>> misleading messages like:
> >>>     brcmf_netdev_start_xmit phy0-sta0: insufficient headroom (0)
> >>>
> >>> Do not log this when headroom is actually sufficient.
> >>
> >> Thanks for your patch. The message may be misleading, but it is actual=
ly
> >> information that we need to cow the packet. The zero value indicates
> >> that this is needed because skb_header_cloned(skb) is true. So it is
> >> still useful in my opinion. If you want to make the message less
> >> misleading for that case I would be happy to ack the patch.
> >>
> >> Regards,
> >> Arend
> >
> > Thanks for the review and sorry for the delayed response.
> > Do "%s: clone skb header\n" rephrase make sense to you?
>
> I would say:
>
> brcmf_dbg(INFO, "%s: %s headroom\n", brcmf_ifname(ifp),
>            head_delta ? "insufficient" : "unmodifiable");

Thanks.
Sent [PATCH v2] wifi: brcmfmac: clarify unmodifiable headroom log message.
I'm not sure whether I have to link new version with changed subject,
I haven't found a way

> > I have no deep knowledge of this code, and if you think the original me=
ssage
> > is actually useful, I'm ok to leave a log message as it is.
> > Initially I had guessed it was an unintentional log message because it =
has
> > misleading text and logs spammed every few minutes - too rarely to cons=
ider
> > It as a real performance issue.
>
> If you enable debug prints you should expect performance impact. If you
> want to capture debug message with negligible performance loss you
> should use ftrace. Debug prints in brcmfmac are setup as trace events.

I expressed my thoughts poorly here.
By "performance issue" I meant the clone process itself, not the log messag=
es.
I have read "insufficient headroom" message as "look, we need to copy heade=
rs,
if this happens too often, look into this issue and make it zero-copy"

> Regards,
> Arend

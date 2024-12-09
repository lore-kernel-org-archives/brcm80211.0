Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F50184556
	for <brcm80211@lists.linux.dev>; Mon,  9 Dec 2024 20:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733774911; cv=none; b=XSw1tdOmfwQCLHcFxsyMiKifBbOv3R4TvP41GgLTe+L7cYb7GhwJV+WCK79u5ZlTam9OBrzD/Rn4pB2Q0h8sv4mghWx0cJj7bR3T9jbNchg0Fk2SIbKtHhgmU6/6TN0kqOuKkDPdS3gFaix3Uu9w1ED/WQ0r0V0sR4Y5Rum5PNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733774911; c=relaxed/simple;
	bh=/eyyrQhI6CrTR4nLtLXh0b7NqouJwLAL2kJDuVkW1JU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Af6FDlVpKsM4ucZravlQSPALJ83YoJybCDvJLbdBPjc35IlLpzFbVXBcnsPExBKtC80pVlrDgM2R6m9oBUL7SAyDyIGn7nBXmGVLOtfOOGl0B670WGisDjqSaHLiUkbr7VeRmBxd9mrGqLgQR7VeMByiaVkypfB/m8YnWTrclTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhXAG6JE; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhXAG6JE"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29737adb604so2445913fac.1
        for <brcm80211@lists.linux.dev>; Mon, 09 Dec 2024 12:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733774909; x=1734379709; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpSA3c70868rkQa80zun5/bralELYwg5L0qKNBXu8ME=;
        b=lhXAG6JEJnE/7dy8Iq7ntdlyZD7RLqb/0dbXgFRS3xbH2XCtoSGaJbDrSVW6VPwsos
         m4/z6bhy7QubQlaTUW3tEkj1LJRcQ5JJqQjQ+32FJBkxRve/MzRdRUFDZ/mO50iz/PPs
         whnh3OlxZmbav8CNgxEVYyBbvVYuAl/2bgBOESY/PuROeLsBGKBeBN2XzycTEIpFPniz
         JIrlmttG+7kssiVzsCcdtsOM3qWa/J7NluYqwRtSuchGqYPfq4OsuQiBu6n0cX85CcSV
         Qv7YWvhVIhyE0ELEguvQk7CZJFw9Y1p0HPzQaYLkLOQkcky/nNmCUBHxJkLHddHwgiZC
         If5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733774909; x=1734379709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpSA3c70868rkQa80zun5/bralELYwg5L0qKNBXu8ME=;
        b=uz3nN9G6fmC5uA6kn3fo2/chj5/eMtnV895KPvXEwqhC421pqKpLuhCSU+yDc1Chu/
         tJHs4ucwIENr8buHAxZAKbmalE/b79xlD8Cf8YaaJraag9O/th0yW7FiUj9lE+nfKLym
         eLudvzkp/ZYWTrgxfu+a3nmX6ZtiaUA3V1RsPLqtJzP63cJ2Sb6QAtnp/N5zHPuR3Rer
         FtMwKmOJLqnzm1dUpo93oxQCggFy5zpaB/pfq8iACnncjbu1CZll1WUGptI7dbkmm3BN
         yKHGxXrEdViAGi3XuJPHLYXTtSPOpINcoWH0B6h6EDoehxnuhTYCagoTf0ZdDveWI/Y1
         rl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDhELM/3pU+u/qUR5y5asTe4m33YrXArdXC+tDRibgVXSMtTnmoXFyxEFe9lg/QLVjXOpdyY3NJnc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk8JKqmXXFxlVqrnZNhascaxSDsBAcbv/DLxV3fGXUaGyC6uP0
	6M2Ui3DzwV7hwZ5p1agec+KbUjyyhzkh8NnyMEv2wHZzQzAF3NG+Rhp5ULtonTuZWzjJQkEovmG
	FVHlcU7mbQovy4kGCIcNQwyLuG2o=
X-Gm-Gg: ASbGncuNoW9wuM4J4bB8OvLOl2/6P1QrBDUBQ4w4Mj1j3P5trRYZ0+1QSgH7EvVr4zG
	0oRkQ7fGQvDrti8VxFp8fglmsgojYAJ1Q0w==
X-Google-Smtp-Source: AGHT+IFihdqariqJEvsKT4cJi4EG8LL6wAtWLTw19Zq3KExJrPDPu+4WUJifbf9vT6jNFqnOM7IAdMTRH98ocBd0pHM=
X-Received: by 2002:a05:6870:be89:b0:29e:6c6a:e7e7 with SMTP id
 586e51a60fabf-29f733478a9mr11363826fac.21.1733774908875; Mon, 09 Dec 2024
 12:08:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241122180435.1637479-1-alexthreed@gmail.com> <be2f054e-5ff8-4fcb-ad50-0dc0d5c03bf5@broadcom.com>
In-Reply-To: <be2f054e-5ff8-4fcb-ad50-0dc0d5c03bf5@broadcom.com>
From: Alex Shumsky <alexthreed@gmail.com>
Date: Mon, 9 Dec 2024 23:08:18 +0300
Message-ID: <CAF4oh-NtqAX6gqz3DnLes6oR3RhZyOEvSfOk=rPPPm=1XzGAWQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: remove misleading log messages
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, 
	Kalle Valo <kvalo@kernel.org>, brcm80211-dev-list.pdl@broadcom.com, 
	brcm80211@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 2:02=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 11/22/2024 7:04 PM, Alex Shumsky wrote:
> > Currently when debug info enabled, dmesg spammed every few minutes with
> > misleading messages like:
> >    brcmf_netdev_start_xmit phy0-sta0: insufficient headroom (0)
> >
> > Do not log this when headroom is actually sufficient.
>
> Thanks for your patch. The message may be misleading, but it is actually
> information that we need to cow the packet. The zero value indicates
> that this is needed because skb_header_cloned(skb) is true. So it is
> still useful in my opinion. If you want to make the message less
> misleading for that case I would be happy to ack the patch.
>
> Regards,
> Arend

Thanks for the review and sorry for the delayed response.
Do "%s: clone skb header\n" rephrase make sense to you?
I have no deep knowledge of this code, and if you think the original messag=
e
is actually useful, I'm ok to leave a log message as it is.
Initially I had guessed it was an unintentional log message because it has
misleading text and logs spammed every few minutes - too rarely to consider
It as a real performance issue.

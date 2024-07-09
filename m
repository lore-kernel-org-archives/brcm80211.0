Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20191B86C9
	for <brcm80211@lists.linux.dev>; Tue,  9 Jul 2024 19:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720553286; cv=none; b=ZesOYfaNR6TNPkV5ebAxGmPUWWnGxBma+hAQ5dicwMX0uPLiNjQe+e90xA6hrvO451SS83x+vlVJmczAAH4w2F3RpbZb7dvY4JB2QFnaKSlAYJ/c1CP3mbUsn/FIlkn1gAJxuU57EberwHIiNx+ycHs5j0kP2RqaepietSrNlTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720553286; c=relaxed/simple;
	bh=7KjDQ6T6YrLC2fAHCdXWe5nbUWinoqBLa9KTDbGYMyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmQefqRVDKsBT+SwP/4N31raeA4qaIXzL1DNcK+yLsK7tdDmJa3qt/Flgz7BmGhRMMSwSEWGZsmkhmtZ23TpD9Ff6enO7iAYHSBIkjoPWkR5UhHAHblqfTcHowhIWwYx/tPviesQOTU3ZQKaQ9yTlSukqX26Pnx3sQNoQK6H6t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWF7rW7Z; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWF7rW7Z"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-64b101294c0so51976917b3.1
        for <brcm80211@lists.linux.dev>; Tue, 09 Jul 2024 12:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720553284; x=1721158084; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KjDQ6T6YrLC2fAHCdXWe5nbUWinoqBLa9KTDbGYMyk=;
        b=AWF7rW7ZDoHrSSTv3JpGR2SLn+Kb7u95IhKptph8Fo9eRq1fAHlyKya2gZXIc5dRwp
         f0QfC4qZB9kxxeUxjbkYjqgpN12Ot4lyVqRh119aqJaD9RLqZZaOdFfnHdtLfivAscqj
         wLBJSRQbqHLoQIsKYCG+2ygTIMOeaPo95xX1HWzCvkC5nFRSSdbjhglxw7LVcoU52x2w
         NNgvhv1C0JKcR0v2TrCp6vx4WwOR8PIaRRHT+0NiXPqKjHEX2VQnl0wfyKK+nohQRe61
         yMJGoo1W1705dSRjwCygeU7AaLRIEjQX4bIwp10Q3if0h+Qti0Coe+owPMVFViVH/Wsu
         QXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720553284; x=1721158084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KjDQ6T6YrLC2fAHCdXWe5nbUWinoqBLa9KTDbGYMyk=;
        b=h1Xi0H/xeRscIhhPlAZqoUHNaGJ63GepCcZZgdEmVIcpu7jkU1fdAt7QB3RE5lNVvp
         I4CLGu7h6ktwgswIYA/5OvKepvMvZH3n8pUOZya0fIsqcQUtt5midHt+dq0246RlRaJs
         uvvovSmztgfc8fSaQSt3BWpEtzPErONyWdHBxgvBGlwycv/BQIUrLRt06ogBfrsuUOCY
         uO9nKXnAaWlXXZthq/saXcGU8s7mWBJBgA77IOEtgC1zsLnUySXJXLmdynRaPT/FuG7W
         2suQgKv+4LUjt0vRiZRjawfpB1BU+5lGzJTXKAXE8V+veIbE5q+CqRVXNX8koMxKlREa
         rLng==
X-Forwarded-Encrypted: i=1; AJvYcCXl/kMAoJ7whM9KJwlNiJIubzUlTtse0aVWIgJFv8PkL7u0H6eD59xe6WBNZDitG2FzoDvZOr1lIvYD+PRkHENXfASLhP3Cr22t
X-Gm-Message-State: AOJu0Yyne8hrzz/a8ZlnH+9/+wX835rhsD4sr+bwQJoeKOm+2TuX3fh8
	y73m9v7RNc5+E97n1eOTLGYXs8eX87mo0R2rEpVSReotbGOAwHm/iNrxl7GfLL7rWGPgYZDEBaJ
	2+5/IZV0yrjxwGNRZqUix0g1DHFM=
X-Google-Smtp-Source: AGHT+IHI+0VczXk6VPG5r72QrvOSCSGn6Tj5Lbq5qTw8sEJU8N6kWRxiYI63gz2mmMwM2P73sqe7iEJ9yp8HBfXnes8=
X-Received: by 2002:a05:690c:6e11:b0:649:b0ca:2c9b with SMTP id
 00721157ae682-658f09c9167mr49405417b3.40.1720553283775; Tue, 09 Jul 2024
 12:28:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1c6684f6-d3a8-4eaa-842d-c21fa2dd81c1@gmail.com>
 <1908d5acac0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAHP5HDP_4NrZtQwcLRhj5efbnZiV=PNZcaeye3Gxx6pqFufyAg@mail.gmail.com> <87ed82naaq.fsf@kernel.org>
In-Reply-To: <87ed82naaq.fsf@kernel.org>
From: Nikolay Nikolov <dobrev666@gmail.com>
Date: Tue, 9 Jul 2024 21:27:52 +0200
Message-ID: <CAHP5HDOP+2kbqrQqyWauECSuY2SWvGzL+6k5D2zmRMPTdnFeMg@mail.gmail.com>
Subject: Re: [PATCH 1/1] wifi: brcm80211: brcmfmac: Prevent sdio bus going to
 sleep while transfering data
To: Kalle Valo <kvalo@kernel.org>
Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	nikolay.nikolov@bench.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 12:12=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Nikolay Nikolov <dobrev666@gmail.com> writes:
>
> > I am really sorry for the spamming !
> > I have not sent a patch to the Linux kernel mailing list for more than
> > 20 years and mail clients do not behave as I expect. My first email
> > was rejected from the mailing lists as it contained HTML. Indentation
> > is not correct in the second one. I hope third one is correct.
>
> BTW I recommend reading the documentation from our wiki, link below.
> That should save both your and our time.
>

I was reading for several days this and the kernel mailing list wiki
before sending the patch.
The problem was the email clients.
Anyway I want to mention something which is not present here.
There are some memory barriers around this dpc_running which I think
are supposed
to prevent such an issue. But looks like this do not help much. With
the usage of mutex those
memory barriers could be removed as well. I am already using such a
patch in our embedded system.
Please, let me know if I should submit this patch. I promise I will do
my best not to spam anymore.

Regards,
Nikolay Nikolov

> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

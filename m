Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FD441DEDE
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521212; cv=pass; b=lxL45pW1EPInPHZVRBQXfTxdrbGtG7V59nog7399NHl4QgKvUU5XrvrULuSZ/XtcIl64bNtOYoMR6spco9WpEvx4MxP6d6eCJPkpQKKk/ERxu7eC2pH+Oc2MnKkbti0Nzw1qD4SwPaxwIoKWwYEv8S6YMH0zgUH9FaaVfm3xGpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521212; c=relaxed/simple;
	bh=75FUM3b7OAtHGBd70o/lKojikJnhrJpzsSjnacprDyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BY35vzWC+Kq4T+HPsZDz5qY3fYQqeypgH+FkWvZUBOuNK8gah4bq33Dbxy+rqxmm1Z+shtXCYBOvbQhqlSe3J9Vjsh0CdUJcO7+CfLX4gVE3qpesYFVeCvGkbrEeF0PzgqZrCpyGkgXnZXPJkgzVWoY5LTWwGlX6+eSs87u6GEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+Ap9aTL; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+Ap9aTL"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69c3044e4b2so223416a12.2
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 11:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785521209; cv=none;
        d=google.com; s=arc-20260327;
        b=ZqmKK93GnEJSFzGNoW0bi+uxEQidry8iE/UiyOYdpZQeidoqmbDj4jFfVadDesTE5t
         1cqTmAsauNkZPUrHpF5D2/QKWSZG3JLsHyU9v9zxxZVAfshBvgpc+bxF3Zzw2RxLadbe
         oglz1JO37ioUnTcB4HamTA0tELY8lRPf8pgoZGajwCINVt3W9ZflpQGv0DQw5Ok3b2e3
         eVf3UqFqFpt50aeRZI7xKVYJVuIBJBWVBkU9n9uvYlUtNJIVVkCWIdldIuq2Qw8Y0kcH
         sEj1Q52wxOo0gd0TqbldzmYtRP5GNXEAv9/bctIHrsGiI/pL18kb8/hB8aluFJW9Uju0
         Y0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75FUM3b7OAtHGBd70o/lKojikJnhrJpzsSjnacprDyY=;
        fh=7iEIBlGnJxkpPJDoYeaGnK+hJlJuRuSgy+d7/KQRkVQ=;
        b=efEtWCJVk2X4ORWI6x9gqsC0W3ZUShnV7KyY8YSE5XblUzlMe1syllIcWU6HTTMiTe
         Wfl7exPtNpnKyO3tsAT5yn+UdtUFikxiMRBYqH6lqobcvNv0jIllJ5yYaeJ4U90jhIT2
         bU+uxt32Gj5PBVhA6IuOjdWwWcjhov4gU19sCjn4dpV/CllG/kiHxJZIo5kzpqYpQ8Ic
         y6EciuNBNBirU5zxPxwQPVZsA1Fj1D6KTbQ2ViEkL7K+f0vq38rLXxylPSEbohLMxWkz
         rpMw15qKc7rQiRvJ0V5IxWns4GuCyCZL+V5gRaKCmalFv4hxUi3DuhrrbYHrywYh2lB/
         VG4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521209; x=1786126009; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=75FUM3b7OAtHGBd70o/lKojikJnhrJpzsSjnacprDyY=;
        b=N+Ap9aTLksgcG941vGP4DPUySGiWcUZ+bf1XyF8RdU600HqBA0yMo8xH8uVd4OdWUT
         avXnBQ7emPS9JnARWYmZPgKOX0KED9maofFtr3qf/pJ/tCQ3Rp46tw7xaTjgj9j+TWY6
         3PZtu1+hCeQ7vpLBI3qXvKWbeXsW8YG5hihySLR28ru2kJdQV9duLFLkYmcYPgFd6mSd
         fcTxwPXicf9gnKv3NeHnlPOII+No1UxFmTj9w/Cq+CQS34f8x0figM24Z65uRnZt/Irh
         WQAnr8RUgbMwRZdWOjX4w3P4bnpQamuJR3Dx3OpNFpzaMOsLAO/IA6WtkSI0nsog6Pnn
         mk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521209; x=1786126009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75FUM3b7OAtHGBd70o/lKojikJnhrJpzsSjnacprDyY=;
        b=aajuedPxHa0zqaWGOZOH2yIZSxrpI6VbIgbh8iOzA+hHCxKNNrXh90hkvvaseVa2fI
         5sLaB0KVph6FmUCYqMx63mx2hShdtIE182nVjutkgZjWvqgcqIKDyJX+QKCmjZ2rKQrx
         yqknFMhpUlcDk4+R2CnYF6ucLSpgIQO/5DnCEON/Ufo5ZMPSrXhHoXLDhtZkmVPm5xAF
         LarEJ29Je5blWHRA31mC1nUiAPQDfRwzBtgP+fy4RKHUrZp0wg1DPH2hA63TlyrHOpB8
         xq4GgHPquJ/W8azlCm8LhAJfIrLYNKeqGidigfjhOav/GjeJtDaSBzse32PTDU4hBrAi
         0J1A==
X-Forwarded-Encrypted: i=1; AHgh+Rr47h5H6klbXbFRVbX/hvdIhJe5j6n86lSk1ooRr3kUS5FbZAdFua0ycjhBYswHmFE6Q9FRahFXeDI=@lists.linux.dev
X-Gm-Message-State: AOJu0YypsHXHoXHfyUjzxXlrDQ3rQcQ0ulZOFZHFTeyNi8r4liIlL6xC
	W+jR/ihK93ds2S9XGzJcOYxhs1pNR9B1w27aMLJfX/VA0ik1DzNECmZPt53VpWFgi+G6ria6L3y
	e+Vg2Zh/QHkCt5yIoj8IyouoheFpo0cGTiMaw
X-Gm-Gg: AR+sD12TD/fIqlc2NvSpeYPERcEOQHwBSIY4tg8m/huzOalfdfpv37EvUIo32FDRVIB
	+DtRXHaaGmHDlGyvFqjtCBoRxkSJLY4dBOE9kqvrpFyYVd4LpUkPPdsyitP2kC/b32opJrccQlo
	xkNrfmejFQ0jeH9YW5HP4lTUXxpHKzy/n6KilA0EcaQErhIHwmkgkJ52/0P9Ht4kxzKKcXc97Vf
	QXXUN8Eav+TRRTZvpz2PRdEFbczqWxI4shxbojemj+eQ0XGScCc+DDOKewbW1uEkxhDuGbfA1ba
	PEClg+EEQeWnmFoJhWyZ/VPGNtiLEOX6BajYEa7M+NF0j5PsBHIdzmkydgUUKNIzHndFQ2nfJdz
	ZZjD6f8zkFtNp6Zt4bbtoG+9O/n9kuQgXl8dvyZJ6BCzY
X-Received: by 2002:a05:6402:2111:b0:699:6415:751e with SMTP id
 4fb4d7f45d1cf-6a0a7d096f8mr496683a12.4.1785521208653; Fri, 31 Jul 2026
 11:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729053408.13715-1-bogdan.nicolae@gmail.com>
 <5cf57b2d-2bcc-481c-87bf-3a034d5f99be@broadcom.com> <CA+ORkNQntwC4k2arcngGdYB3mwsbJCkCRNTJRJ2GoRxjdGXLzA@mail.gmail.com>
 <c452116c-6215-4d62-b96b-72ae23a478e1@broadcom.com> <CA+ORkNSsb8Z5eUVH1GRvWtO_he6A+_b67ov2Cm6VJuWciJeKZQ@mail.gmail.com>
 <CA+ORkNSG45LrTu09AiHNwTZ882Yybq-3E-=enwe+2eA36fEO4g@mail.gmail.com> <fn7xsi3b5k6bshyueeybjdb4vzudsdwt6arjn3swj3lszew5nv@v5xtmaxhslbm>
In-Reply-To: <fn7xsi3b5k6bshyueeybjdb4vzudsdwt6arjn3swj3lszew5nv@v5xtmaxhslbm>
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Date: Fri, 31 Jul 2026 13:02:57 -0500
X-Gm-Features: AUfX_mzigRw56usW4zRA0dC1msoMuDsClGXIVm8msldK4FoPAVRdIM9slRQauzg
Message-ID: <CA+ORkNR0itadq+Wy0sSLwrLbDYrf6rFdUj0+L4u9K=Dczw6yWQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: configure SAE PWE method for external SAE AP
To: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel@vger.kernel.org, wlan-kernel-dev-list@infineon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gokul,

A detailed explanation is available in this issue:
https://github.com/raspberrypi/linux/issues/7528

On Fri, Jul 31, 2026 at 8:51=E2=80=AFAM Gokul Sivakumar
<gokulkumar.sivakumar@infineon.com> wrote:
>
> Could you help us with the exact version of 43455 firmware, Raspbian dist=
ro and
> kernel that you are currently using in your RPi ?

Kernel 6.18.39 (fork form official rpi kernel):
https://github.com/bnicolae/linux-rpi (main adds code to capture
firmware trap; wpa3 branch configures the new iovars)
Firmware: BCM4345/6 wl0: Oct 28 2024 23:27:00 version 7.45.286
(be70ab3 CY) FWID 01-95efe7fa
Infineon Backports (used as a reference): v6.1.145

> Regards,
> Gokul

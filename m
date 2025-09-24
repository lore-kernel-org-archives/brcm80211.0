Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D03222562
	for <brcm80211@lists.linux.dev>; Wed, 24 Sep 2025 02:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758682783; cv=none; b=Ldi/9k+Lo4wxHckuDXlQCgZs8xyXB4YmFLV+AnJgJFwbLSs/dl/uvg5ZLOWwLM30GNPjxU0zOrBYBA0i9/pjDj7g04jybTLqs2P4JqyvHpbd94hggLSUMLmD9FCuOlaTpoEczlTJ6/RJ/wvaURklBbCzYSPiXtwsgg/Nd5VYNKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758682783; c=relaxed/simple;
	bh=K0LCRCl86/E+hbnMzqJRccdVEjWIG0h84oyt/QPKKnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPuVfvmGny83EguWVcvvF0cpfNS8SIXOrpOVnmuKZqWlh6y33WXqJipRDQ5zIgKNhC/SFlA3+awNEeSsjWfA2VN2ZesAZeXQlvDXsXzjbH0dkWYb9NHaHNGUffSxHLah4xxQ6exVZnC92fD9ebVdSQ7DDtGed2bZ5eD30EoOTnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJVmlMe1; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJVmlMe1"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-ea5bafdfea3so6415006276.0
        for <brcm80211@lists.linux.dev>; Tue, 23 Sep 2025 19:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758682781; x=1759287581; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K0LCRCl86/E+hbnMzqJRccdVEjWIG0h84oyt/QPKKnY=;
        b=cJVmlMe1ntyw/1cAJBZah1D6MuHSJwlF8Mv/FqFvDNhWHV02ZrUPPvNX3a0WCja3iq
         ggWYBz8YEM/hpj9LZctzYS61uMMt7Bxm+26ft7AvJCQuX/RhCc0Jy6+UjK0HbJXdlVLP
         9xiY1PXtY9pyfhyW6JkXScE1sBLWqb1WAipnlIY/PCLEzmF5RHEZTV3B78G7bY6teWYw
         +qVTqerq0YVmshzV1UrV6X3OE+OxxpagusXjZjAjCtYzpGkTd1269LG7gsDnqM00+KMr
         CibMOLkBE4XNY9hpAwvMl6xxYdD/TBrZVYB2US8OE8H1giWk8EDhLX6ml4IxtkmhXmk/
         AReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758682781; x=1759287581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0LCRCl86/E+hbnMzqJRccdVEjWIG0h84oyt/QPKKnY=;
        b=ElX3V55X1ZFNX7xA/hl+bdCg763S25lvOqHinREEDtSjbnhy6NPSs5NqArYzeZK0Ln
         6JHqqcst/+SVuN4NHyMVt0mGrDaKWYWIA+r8EjE6jQgo/uDGKXQas6zZWs2tJcwIfsZS
         BXJssgx9GEXrJmt2FygIhb/XQdrIRJ4mGVaAHszT4S1/9lPKp+8yGDTUWfB4zaB7j0Ub
         ucHhh/qtswPUy9meVSeKo5/mtLHpIf/aTYhhaTYoAD4VnTB3mQHvGXlnw3oIHseTy4ix
         YZ6J/zVrTng6y1Bh0tyuVlQIkOqnMu+KntTHG7NGu7NAG9l5BOK6/eSSjncVboKJSL3m
         5tQw==
X-Forwarded-Encrypted: i=1; AJvYcCVL4f9KidyhyR0WFn3VjD0vvedWtFGrnk07KnJXw10JyYN5BybxAXcywM2C1tahKrSpFlEDXKHunJA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yym4BZ5j7FSl2xebGyHkD3kmGbeqDWYO2B2rRpT6gBZ1aaGeKel
	Bvf+uze6960QxHLr4ivwp6/5npUtKAozBgGoIJwobjArGJpdNCrgQAtl1qVdS1B+IP2JEKYyl8f
	Vb0x3teKHZ95fWi2C+wGaNZ5DMYj89N8cndWRB7M=
X-Gm-Gg: ASbGncs/fuIlYvFc/X2i4M/Ru6YVTiz/ddUVxckWLw//Joftkj+qgWYHDxw5V2MoAAF
	IPFL1XL5wXiLGnyNarmo6BfEWP7vj0s4PvVOZObS4ZcxNihNt29gmBSNrg3QcNRYGUOF59SXqpr
	FbYuxcnJqMDTtr27dFO5xDpVhY9fQQf4HvDEL+fubBhqG++rCPvVQkQJ7VLf2nsYmicVJVLBxBt
	9rveQ==
X-Google-Smtp-Source: AGHT+IGn9alfmVUHg4s/EOSBDcyVeO2o2b4luEq/9VzOv8PSl8c2p18Wc2e62ATf4njqxKj8/5WQBlx5CdWjoV5QOQI=
X-Received: by 2002:a05:690e:150d:b0:635:4ecc:fc21 with SMTP id
 956f58d0204a3-636046650e7mr4242077d50.41.1758682780546; Tue, 23 Sep 2025
 19:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAE3HL_yv8t1Rkd+jLfQMkc3YrNONQp0pRFESV+v92ECf_+7Xjw@mail.gmail.com>
In-Reply-To: <CAE3HL_yv8t1Rkd+jLfQMkc3YrNONQp0pRFESV+v92ECf_+7Xjw@mail.gmail.com>
From: Hsien Chou <s311332@gmail.com>
Date: Wed, 24 Sep 2025 10:59:29 +0800
X-Gm-Features: AS18NWB8jHPnvcaCYS_yFLDa1ZG3B37swbIlzMYM-jKhhrBXrPRh4H2FVUfXz2U
Message-ID: <CAE3HL_yETM7LBD5nu3V3zzfR1fThbAzULA=+YJt2tPY6=769Bw@mail.gmail.com>
Subject: Re: brcmfmac: driver crash with iOS 18.6.1, potential DoS
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, 
	brcm80211@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Arend and everyone on the mailing lists,

I'm reporting a driver crash in brcmfmac that can be triggered by an
iPhone with iOS 18.6.1 or newer. This issue allows a remote,
unauthenticated device to crash the Wi-Fi driver, leading to a denial
of service.

The full details, including complete crash logs and a step-by-step
reproduction guide, are available on the GitHub issue page:
https://github.com/raspberrypi/linux/issues/7033

For a quick reference, here are the key details:
* Affected devices: A Raspberry Pi running as a Wi-Fi access point.
* Trigger: An iPhone with iOS > 18.6.1 attempts to view the properties
of the Wi-Fi network.
* Root cause (based on preliminary analysis): The driver panics,
possibly due to a malformed or unexpected frame.

Please let me know if you need any additional information to debug this issue.

Thank you for your time and attention.

Regards,

--
Ken Chou

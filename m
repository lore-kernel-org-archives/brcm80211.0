Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551249;
	b=Jeh7pSaJCG5i2b8QM5rpPb0aXq8AVFxzelcmmE8IresUjl9rylKJmdt1oF1J277IchV+
	 8l2VDjIokPA+DNIRABtA3c5gElMMVlfsYuLbi+WSVtRqd2eAQYJOnUzJ0fdFzagf30mrR
	 d/e6k4AFeGf/P9TobwmB/x9jPI7ZuW1JEZY90gketstxbqM/BnqzIAdB0F8mHuq6D2CQp
	 N2ftL1GY3k0Jg7/mawXZ9N2H1HvgQnjYeVPuBLgfY4k0sUonfDBl+Ra43Nv94lI/sq7SG
	 NcR6kMtm8S9wklqPyX6WZjyOjViPqwIHoRlvcRhKUpppD1kSGrzlSCe/AXWqcPYSgCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551249;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=mltBfVBmYiliDdY8G4ZXN8O5/4Tt3NMy78VDvngDTpk=;
	b=rbPUPT3GHzNwlFQHswOoAC5p5dC4Q+wUDTln19upFs2HvzGQF+alNI8rtejGjhP7r9/w
	 tiTwG2hoP/d8oh6b6SQLdWGhgNHPcwqfSBLBC1DTETj+ssxRaQ5hmqNhYGAYaoJTJZ0Nh
	 KymzhXr3QA4n/VJwM0PCWXEahKcTZcHESzGkxZa/0aUfVB/ttXJjTz5RJt/ENc+i8g0/7
	 v3IkITQSgknchV5t71w6trTSw97FaCUbKlioTLOddrva3+i44Q2GO6WB4gv099GASzFW3
	 tm4OzTr7v7DnZV6W7ZUGdG+9N7TNXEHIJ3rgQEf+ynB9fPkveqys5bvm6cEcjIuY0Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P9xx2MlC;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C6606A6BA
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE4C6606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P9xx2MlC
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso3412973a91.0
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551248; x=1796156048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mltBfVBmYiliDdY8G4ZXN8O5/4Tt3NMy78VDvngDTpk=;
        b=xWeuE0bJ8A9ZWYotJKavxCMmvmb8oSIBrpQ/049EjtqkqaLKKQYUV/uJTUD0eSBxd5
         J+zQyIAmcpX9rl/YEAfi/PDMsuyu+txdrENTWQPJcXsZaBCwws47Os7LtF0Ic3tYNw8j
         xW5zgK8CyzSMvf3DEZqN4sPvabnsH2AZuvfKhDdoikEebRtaxOAkb2B5+ei/5swvzkk+
         ISA3tYUVc7SzHAnct3pejekvBKdP3nX86C8YvBwB/Of4DobGjTRdqoSp77pWoeUsC+rM
         EQJhkwbx1g5TiGf6s5zS0nO+UQlRFUS8VG2Ugji6iztrlXwkFqDvb2jacFk5oW4cvBX7
         4XBw==
X-Forwarded-Encrypted: i=1; AL+hErEbaixIj/pFsvP247yK3gZBaJ0O6/Dn669+uRVsNz93WFzC8Qw90vIY1uVVAtJfbDmYCp2FZl8KZjs=@lists.linux.dev
X-Gm-Message-State: APuU4Z82lBjNKH7hb5WBa+/UUJZvgzP2Iifibu+BUEa6rI/jjWtb11GO
	1fHnkShu9QQlWPfc2szyI8KAdFdCBhEobmWiIgzkcchPfY0QaGv6z/M18lpxLqK3+WIBGcqFj3U
	ey87J//R0xQu287qiV2FmhP/Ychqxy8UB5dQiSEjwE/UtTvsEc+j5bBLeaTxxTd48+VVHdAasbg
	4vsOdbOsVktUUH3MhDe8aJe2/oRceq4lI3s9DLNTFrSWrAT6plng33qv/eAHEpLTsefnhGZY0yz
	N2cip0ru1QJjxNqAdZqWA==
X-Gm-Gg: AZFdTZdvYdnGcqFh9aU54Hu6N9vxGBZiC/sfXa18B1Ld4h75nK0qgE9LV00mm3Kdf/o
	sffFM8QOoLXM8wwXxRLWrVhHEY/WNlUK2o2BQR4+lEmCkxHJTNclLjbpcoZPkw0ji3x3/skXGB8
	nMaVtaTJHDxlz792CX+SO+tXIjN1UFSGf5ftfA0/a9kDsNf9ZZX5N4qzhL3rsWbeCpRc/x9LYLS
	eLItn5xq60zp9D2UmkTDqajr2b7AulgdRFMtVeIkyszSHJoIhmd4MzFWL0a+Bb8VZcwC2HIYluA
	YDRMj5qR5vSxwqeGXiskNstuxxZe3I0GfL0P7JStrOs7pRy3da4SUpVyU7bTZugE1KsGb4r9s+O
	zbJ3X2ziavjVJ/rOBwwiAkePRsQGML5tv8hVPXPa73lbShODGLLlKsfWdrR6uW4q+C+fi5Q2ZOh
	I3RnV2mcZzhfAVrug4G6ynp81zwEJ9V3Na26Bo0Ws=
X-Received: by 2002:a17:90b:1802:b0:3b3:cae0:2b6c with SMTP id 98e67ed59e1d1-3b41c92c569mr16568948a91.34.1795551247658;
        Tue, 24 Nov 2026 12:14:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfb370asm6005084a91.0.2026.11.24.12.14.07
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55cc3c32e15so55209661cf.1
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551246; x=1796156046; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mltBfVBmYiliDdY8G4ZXN8O5/4Tt3NMy78VDvngDTpk=;
        b=P9xx2MlCWuhY25FH3ZsylzqsqQPxirVm654viDtF+9QXmx/p/tFPQ9/UmP92BhmsP9
         XSdHWZxNFQMimvu3NG1XvsnXU72mb+SafIiAdSrYyD9jh7TicezJliEeHoWPfXIlrj+d
         lT9q0YJsY9RsRAltzdjfRbgqLXgVikPw81nzc=
X-Forwarded-Encrypted: i=1; AL+hErEGbhPyy4ZK2NV2j2E4mrpDMszYjJd3nsYKS0RguzwfahgJpIiiNmUTowNzMJ5DTxIBFYAIbDgesiY=@lists.linux.dev
X-Received: by 2002:ac8:59d4:0:b0:533:3af3:43b9 with SMTP id d75a77b69052e-55d76a1c9a7mr301697131cf.44.1795551246188;
        Tue, 24 Nov 2026 12:14:06 -0800 (PST)
X-Received: by 2002:ac8:59d4:0:b0:533:3af3:43b9 with SMTP id d75a77b69052e-55d76a1c9a7mr301696581cf.44.1795551245711;
        Tue, 24 Nov 2026 12:14:05 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:05 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 1/7] wifi: brcmsmac: embed bandstate arrays instead of separate allocation
Date: Tue, 24 Nov 2026 21:13:56 +0100
Message-ID: <20261124201402.3499613-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-2-rosenp@gmail.com>
References: <20261111042554.232998-2-rosenp@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 10 Nov 2026 20:25:48 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> Replace the separately allocated per-band state (struct brcms_band in
> brcms_c_info and struct brcms_hw_band in brcms_hardware) with directly
> embedded fixed-size arrays. This removes the manual pointer arithmetic,
> two kzalloc()/kfree() pairs and their OOM error paths.
>
> MAXBANDS is 2, so the embedded arrays are small.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmsmac/channel.c     |  8 +-
>  .../broadcom/brcm80211/brcmsmac/mac80211_if.c |  4 +-
>  .../broadcom/brcm80211/brcmsmac/main.c        | 82 ++++++-------------
>  .../broadcom/brcm80211/brcmsmac/main.h        |  4 +-
>  .../broadcom/brcm80211/brcmsmac/stf.c         | 22 ++---
>  5 files changed, 44 insertions(+), 76 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

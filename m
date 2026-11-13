Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594306;
	b=SSNqepO3pMVOHQ+bdMEwxxW1EO42X/WyMW6kulPUhl8r1M3NYOWjdv5qD0yAWnM82hW0
	 el7jEOH0dADjqdU7KOMwmF+RxvxM6pLZOi0eHVehXJN9eZTwFrxlKcu7G9vMDzjgI9CaO
	 ARyo2q8thNZko/6IZ29vVhTvpLWDMcNTbqufDgbfPR46i0GnNy7KeCeLRzZ0mju/aj51a
	 ysTfSMkx3wXLU9Gd7w7E579NAzc+prA9iLrJ3YpAlMakikaFG4wt+TNsvVcQyoROYXhIQ
	 50WbNTHBY9mVC6sea3/01ti7tymGOaltt/dl1shHEq6jDxILQFkQcjXHSS+vf+PkOpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594306;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+4+M6Qf8kgsKLvqCkp78aI5bxXP1So+oEpWQ/VILqxM=;
	b=36yiJG2wgfmgFJRfTO7JoxtRabZgEvmTpu/vcsLx0WnS8x+cCOce5iruy8ciViBmVkqu
	 VkAuty4dU3+ZqXcdPjXFG9th/gyrboHqi1F7wQlX0GpksQE0hdwWk6PuXQZFch9qdPBRm
	 zstT9pLPFBNQM8La5/pBFAubMs8j0YK4IiZAcrCCwjcwj0djgENy5V4oG+ky5CK6FysHg
	 JIX1VtuQ76DQK2pMHizUAHQ+/wQkhRtMftsMtgTLU7R0ErY+RhK0ivjsfclX+X2xXNl5T
	 WzZjTks7d0sTpCwLIx8cZSd5oeg/aItjemt8/VirOYvJhd0nZJ0prmMSUs9vlwuJ52g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gompa.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8ED606A32D
	for <brcm80211@lists.linux.dev>; Fri, 13 Nov 2026 18:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E8ED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6de2f213b7aso498212eaf.0
        for <brcm80211@lists.linux.dev>; Fri, 13 Nov 2026 10:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594304; x=1795199104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4+M6Qf8kgsKLvqCkp78aI5bxXP1So+oEpWQ/VILqxM=;
        b=vdnbGPWbSyu+/bAAWlfLU1lGA1yT7iMq7+elsavK2sOTe7EKXiWA2VDLkDn2rTuKap
         vHb+9W/tig89lm7Czmioj4Px/FZW8yA75j//WFxVpPrp8m0mxyi72sdwPFFQkGcXPsE4
         DCqxFEKkaPbnqSc7Yxq1+M9M/Waapjys0dX97nHsJRP123lwt+RTewvKOVU/+jPvyE7h
         mcFvuq9PLykqsZ9//JgoBIwVcvF/huqP1iJE42d84UmDt+Hi9wIWt98LqaBea7rG6BiF
         2EYhu+AREUOat/GldUg62iU1oOKOTUmywg+28gsYG6qpcBpY4l+INybfUYoT3fBzIkV5
         a/og==
X-Forwarded-Encrypted: i=1; AL+hErH0mtQsm+7AeJSG4cfliTbNZ2ubP+B8ZGxBx4R/xxfx2nwRlx+awd8e1Ugv1pP6ZdYkkXtdNFjA8fg=@lists.linux.dev
X-Gm-Message-State: APuU4Z+HHV9UONO8pVMtGZhJClYGZTo4fP3cEZYaYl51gwUfAbadnmuE
	f1WlR1GnLcEe/l7lvoyxlxzsnikr/5EJFXf1UclaOR5eafimgnKtKANtWdnKvA==
X-Gm-Gg: AYBFou2QDW9NPStmFWNYBwivyLinQ6xE6oDaOqgfZFKxc0mYNVMUjq+J+GV2KGr7wj8
	JmqZA1dTyG3e0RnDTC5FQU9a3yKLE7dHf8mpoBgmKuELX1MIWIp2FkZUsH4/jyvZRJbaWqqM5Gg
	AC5wYGNUBn8RLaujyh6Hje/Lb9MzymzaX8K6XcxqUVetJxbOuO2xsuRPypygKoCRUCeA8lTKSrG
	Op6AY+akARAszevHLwTiCVYjA3hhmONmLTdqW3iEszP7EtvjPbFCmvZy6s0/RMRg4dJhhsi79jW
	eDBrVKBoXhCoKPRzt5anvhxAB/zmFyzakqxmx2RzSxq8b0oVFOgxRrzek4VtPsdQkUBVUxHuXua
	NNY47IdoMjwt1OH6V4DD56HNdAuSSs2r2vc5QDGKkNYEqnG5101lfIqRoT3r/dUwhd6xlBI1rWv
	0+HmmY+q2hjZq4emSprgP1UXWn0pWK840CfxrAyt/6j8ZTh3uhFDGn98hAAeIj8NvqgiENog4Qv
	X+sXgmeUXK24HmTZqE3K1/I6JCkiIbK1mLN9+BWYF8CuIGFhSC2zOGR/0/xXWYJU0w9W6iW3aa1
	1qzMXbqvRGU3mpl9wBJ62uE1JUZQP4dDX0Z9xqtlRuYUMPdfAebwsgyZaomACEv8UzRaTCJGrc7
	wAUa/Zi5Q7wtheiCZTYFhYmc2NYnx9Z+3b+o6YtJSpcmL4jDYGepctQssZovzoL6RWgvNa3ipdn
	da
X-Received: by 2002:a05:6820:55c9:20b0:717:da:ba24 with SMTP id 006d021491bc7-71ab5183dd5mr1255161eaf.76.1794594304423;
        Fri, 13 Nov 2026 10:25:04 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880a52absm3235248a34.6.2026.11.13.10.25.03
        for <brcm80211@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:25:03 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8470d7d430fso528903a34.3
        for <brcm80211@lists.linux.dev>; Fri, 13 Nov 2026 10:25:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGGBwZpSlLohbGnJ4dgBfwA//FeX/r02lW89nIDPNr6cvjwIRFfMPcG8oGEgZ43IUEtxQfhcEnwMK8=@lists.linux.dev
X-Received: by 2002:a05:6830:2695:b0:83f:f24d:fe19 with SMTP id
 46e09a7af769-8628979e65cmr3203276a34.3.1794594303480; Fri, 13 Nov 2026
 10:25:03 -0800 (PST)
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113-6ghz-v1-0-0b9a67e413a9@gmail.com>
In-Reply-To: <20261113-6ghz-v1-0-0b9a67e413a9@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 13 Nov 2026 13:24:26 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9XODS=vU-tjZev90Rng6D_B+9vxek96mV8yUpXwoQ7GA@mail.gmail.com>
X-Gm-Features: AclHuK9fW5jJ3rn5jJzhWh_iZufJsywX71GMdWHbE-bhsHtoOzuaNfj98eY9hCo
Message-ID: <CAEg-Je9XODS=vU-tjZev90Rng6D_B+9vxek96mV8yUpXwoQ7GA@mail.gmail.com>
Subject: Re: [PATCH wireless-next 0/4] wifi: brcmfmac: Add support for 6 GHz operation
To: michael.reeves077@gmail.com
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, asahi@lists.linux.dev, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, 
	Daniel Berlin <dberlin@dberlin.org>, Yureka Lilian <yureka@cyberchaos.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 4:20=E2=80=AFAM Michael Reeves via B4 Relay
<devnull+michael.reeves077.gmail.com@kernel.org> wrote:
>
> Hi Arend, all,
>
> This series adds support for 6 GHz (Wi-Fi 6E) operation to brcmfmac.
>
> It includes HE capability advertisement, 6 GHz chanspec and band
> handling and PNO version 3 support. The PNO support is required to avoid
> channel-number collisions with 2.4/5 GHz during scheduled scans.
>
> It is adapted from our downstream work in the Asahi kernel by Daniel
> Berlin, but reworked to make the code cleaner and more maintainable.
>
> As I don't have a 6 GHz AP to test with, Yureka Lilian tested this
> series on my behalf, on her Apple Silicon M3 Mac (BCM4388). Connection
> and use of a 6 GHz network was successful, without regressions on 2.4
> GHz or 5 GHz operation.
>
> Thank you for your time,
> Michael
>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
> Daniel Berlin (2):
>       wifi: brcmfmac: Add support for 6 GHz chanspecs
>       wifi: brcmfmac: Add support for the 6 GHz band
>
> Michael Reeves (2):
>       wifi: brcmfmac: Advertise HE capabilities
>       wifi: brcmfmac: Add support for PNO version 3
>
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 477 +++++++++++++++=
------
>  .../broadcom/brcm80211/brcmfmac/cfg80211.h         |   2 +
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  68 +++
>  .../net/wireless/broadcom/brcm80211/brcmfmac/p2p.c |   6 +-
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pno.c | 147 ++++++-
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pno.h |  41 +-
>  .../net/wireless/broadcom/brcm80211/brcmutil/d11.c |   7 +-
>  .../broadcom/brcm80211/include/brcmu_d11.h         |   3 +-
>  .../broadcom/brcm80211/include/brcmu_wifi.h        |   1 +
>  9 files changed, 585 insertions(+), 167 deletions(-)
> ---
> base-commit: 3c311bf321442d4c4f452a1a08bc9efce242a1f9
> change-id: 20261113-6ghz-a8d587ab3cce
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

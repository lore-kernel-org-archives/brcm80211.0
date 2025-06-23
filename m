Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF803AD2C
	for <brcm80211@lists.linux.dev>; Mon, 23 Jun 2025 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677947; cv=none; b=c0GTW39O/PYhKlUVhwYbLge8+Q6IbXz7LT5IkA126DGsqLnd+WYCw+3BcRIuet1wECzx5Vud8aPkAwGjODVnwja3nHrAxaEPN0FZTtQTk/ch1DIuWPop8658wG5WzB6LpBaKtnTRAUQa56A70+nX23FqXlfjScjvWVu1nJhlKLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677947; c=relaxed/simple;
	bh=uRDfnm7WYxsAA3wi/a47iAORuUGIqvp0GQ+S9uEPTyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDOlmws0pUU09kY0dz1IeMKwVhh2enMiUTDpB6Sm7cpDvngz54lfyFvWcq5fR0JTx8fc7IjKsBMoLn0OC8xFpH5+o90+GsNn37Vc9UIn2JPqGZzbm4QyK4vvXiEcI4VWLYTZT6QpwNaOpGXk8g7N/6mgOcJC6f7BiwqtGUNX2bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mt1sdigX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mt1sdigX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B73C4CEF0
	for <brcm80211@lists.linux.dev>; Mon, 23 Jun 2025 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750677946;
	bh=uRDfnm7WYxsAA3wi/a47iAORuUGIqvp0GQ+S9uEPTyo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mt1sdigXkMMYrBzhxGia/7jkS05+muKLt47wyqYnBlC6tFrcd+FUd6Dl+CfSx3ufk
	 Km0bdvuDYOi0LailxwBwKY95RA+dczM2RQxJleKpMoAexQy/8RtuuXeGmnJ8SdOH6c
	 wFgIXLVjMQAXnvS7/hqAB1ThQs+lMKfoB8yZ9YLrN+ocg4iStxRBTi4vC+ENsJ/0Gc
	 aHkehjjqJISVXNBEvKToSQg9H04lzJ4iwLnW63U5eeYGAlY+56y24uDRj+DpErsjCu
	 ECdIfk8dnyK1Ovxr/MkN1s3EwOObC6hhwvpH3VpKmRXTJA1b/QUEcoYmUuOg24mVeB
	 geYkVWGXNWrow==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e3980757bso33823047b3.1
        for <brcm80211@lists.linux.dev>; Mon, 23 Jun 2025 04:25:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUswjpVN33455dEo4dbh1nM0zO2F+OItDTDWKsyaI3LTurQRmA9RaI+q5PbeDduxC7vVeSnPb3PIyE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOT6V/azK22xjKk7bubBL5rgoZsuDR1MXpq55Tp/418BVScHXr
	5Bs8cs3kSMcDOitEbixkHQevZMrXJpTPu6YYyscTKb4QRzvPBzOC+aAYmef3B5Y2ZMRRC5Sq12A
	aXxHoIvd+bpKes+O+93BWLgrlzC56lBY=
X-Google-Smtp-Source: AGHT+IFYW3EtZvBgTt52w7Ze6C2Pc4TCL++JKaufVUoNcMd1WUSZFi/B2kuCSR4kCAXtoVx8w++XNBJOzjopFe9+5Xc=
X-Received: by 2002:a05:690c:6084:b0:70e:61b:afed with SMTP id
 00721157ae682-712ca34f9cdmr163532917b3.7.1750677945826; Mon, 23 Jun 2025
 04:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622154836.2231776-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250622154836.2231776-1-martin.blumenstingl@googlemail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 23 Jun 2025 07:25:34 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5_qMVdwAa_vLp7jkv-wNQkkcM-HL+CwZhsZ-WOszQFRw@mail.gmail.com>
X-Gm-Features: AX0GCFucBUDgwu_LRj7V-SawGWSUfKgbUbsjpv8v3jRKb2FwSRfjROCp4YPXT0s
Message-ID: <CA+5PVA5_qMVdwAa_vLp7jkv-wNQkkcM-HL+CwZhsZ-WOszQFRw@mail.gmail.com>
Subject: Re: [PATCH] brcm: Fix symlinks for Khadas VIM SDIO wifi config
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-firmware@kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:48=E2=80=AFAM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Remove the duplicate "brcmfmac43455-sdio." part from the symlink target.
>
> Fixes: c629575aa5ce ("brcm: Add symlinks for Khadas VIM SDIO wifi config =
to AW-CM256SM.txt")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> I tested it with the correct symlink locally was wondering why the
> latest linux-firmware package (from the Arch Linux) repos did not
> give me wifi functionality. It turns out I failed at copy & paste...

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/593

josh

>
>
>  WHENCE | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/WHENCE b/WHENCE
> index b43d6ef7..3b69b759 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3117,7 +3117,7 @@ Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brc=
mfmac4356-sdio.AP6356S.txt
>  Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP63=
56S.txt
>  File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
>  Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac=
43455-sdio.AW-CM256SM.txt
> -Link: brcm/brcmfmac43455-sdio.brcmfmac43455-sdio.khadas,vim.txt -> brcmf=
mac43455-sdio.AW-CM256SM.txt
> +Link: brcm/brcmfmac43455-sdio.khadas,vim.txt -> brcmfmac43455-sdio.AW-CM=
256SM.txt
>  Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-s=
dio.AW-CM256SM.txt
>  Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt -> brcmfmac43455-=
sdio.AW-CM256SM.txt
>  Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt -> brcmfmac43455-=
sdio.AW-CM256SM.txt
> --
> 2.50.0
>

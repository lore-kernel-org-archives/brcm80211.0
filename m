Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11073264C4
	for <brcm80211@lists.linux.dev>; Sun,  9 Aug 2026 04:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786249345; cv=pass; b=Wu+fKXLvmNjt6I+eWkYdLvn7msAl7t6os6NfFcF9oDa6zRHpuqcuOQXNoVOU5O+jQ0SdGNwxqWtwJTiUGsq8DTUwXyPPsNr7ZYAoiRPX+hGZw34Ia2ZOwzmP9p6YIwKC9VysAlmim121NvFi5kip6mplWcb4nsyaWJd5+G+zR3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786249345; c=relaxed/simple;
	bh=qvruJbn4oU0Zn3xYlwL0kiQV3mB6QkY/2kDskhbPhiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkhLn6Hw/GbpgqOHY6HZZkaeGfWw3rC1HPuYhH1zowMjC9Xthx7rp/HywsaZaLiFuV3EsJDNecKLeIsyHDBVBcsKwGf5jPwWx3tnPMHQ5NBoJAe+OR79NHwNt5Yzil7JBPOaFKmzgJMRENwyCsZnCDpmSj75cQQhdqS0o3REYCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpU/4gRl; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpU/4gRl"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a18af264f9so161960a12.0
        for <brcm80211@lists.linux.dev>; Sat, 08 Aug 2026 21:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786249342; cv=none;
        d=google.com; s=arc-20260327;
        b=h8wRJrjtZLZ8TLVuM4RubjRWw/ved0r/Gsg1Lz+OAEK1LaqU68P56fW8B9/wO4u3gP
         3BBZj2I3b2177BrM9Y8Q5Bf8G+VrUeGVDmBn+p5o+VqSScbJbaMi7v4ZG6BPSLZFyijl
         OisFiCG5ZH4lsM2ud29r5/sCPgwGbtA20Gk0klvyWNL+ZdBplzuKEcHuczH/fbvNmllz
         VgrlnyEXjSRWCeOr1Zi+sJ7o3EwVkXgelEOu+n09JEnjZ+mmtqzmFWQUKh7CoyE/a5SA
         wtqkm1FrZo1Uu1h04sdNxaBrXR8hSFbcZDi+cQM1mR9j9q7H+bg3hWEzuDCn/O2IEIt6
         3J5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qvruJbn4oU0Zn3xYlwL0kiQV3mB6QkY/2kDskhbPhiY=;
        fh=Nqqb2PParPulsgMKMarMQ8zTpN2XYnV23uUtrGti6/k=;
        b=n+TrdIKq0lUhbWLRDheIUn9WdeZpJn4RRmUr8yg44gB9xzjHJ7iuUTLUtCznVxT2GD
         zM2zMMkKpB0QpCbubRQF3ydqO4hDEIC9JmVAKm1pd7MHvQxDBMj/4HQBDwlO1DMU4duW
         ZwQ7pTIZZZeyZfsHzcKNd+Hj0XUTavPRYdqnpPqV0aHumPpx7nKdoL24lehjWPS3efuK
         6ZECy8ox8N5CLIVxTZR2+vnWl5laaZGmKSTqNtnmk4J0P6SzuuSMo6XYzEwXLrBRnQ7o
         3eh+5th5nIZH6parx2rfBz+/Ri+lRB2PjyWMP0SaooCa8zAzxvKSWmyp+GqlnpTqN5p8
         LZ6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786249342; x=1786854142; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qvruJbn4oU0Zn3xYlwL0kiQV3mB6QkY/2kDskhbPhiY=;
        b=bpU/4gRlzgK1wseOY+HlXhRPQgQuMhbtjxU6eZh/dFG1IDdUHG3+9lmEIpi/DM8J3d
         OAHF80zdCs5guWtlaf+l63jjNu51QsxBaK9sO9H4SaZy0FdNSRRisa9n7IAJC1fFB6je
         fkPYjNTuhf02tShYiKTktQZPz9zug8Inm1DAoe2V5IpnVOBlwCYkAdd12EGJx7+aMe3X
         CTbojj7ImYpZqhBEOE9XKXffKvZnfDUMXTplcxaZpXRp5KCb7sGkayXkdqieFIygNSGa
         s8fdVP6XNiwSaZexXUs5/0/hLDCrlAqxDZBvhV2P2dPDmpF0fNE3I5ARaGWgtUpCkhhe
         g8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786249342; x=1786854142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvruJbn4oU0Zn3xYlwL0kiQV3mB6QkY/2kDskhbPhiY=;
        b=qba2lSG0soLHC40g9GL11YNAIeJJ61rVcdrrPtNP2wRv77W1zf72R3h2wwqUrhGvdg
         1h1JQWJdDg5OCXjTHLu72tbVuw/g72FpegreS2yWcTGlHAfhIvWsY6esk7GlVyZuQAt2
         PjFsJOXFkWHOfU93SMvYSXLIHGBYBTwghyDhVDaL38MoE6oI7XyJ6LRF8lWe/75fbA53
         7U+2jeitLjVgyPyWFyo+veQH0qdwrLEBNhXS8pBInldfcU8fZioJQOC7HFhu/+zOdKge
         pwkbIzQZ8JmZElX/Ay6+RlOL6UIRWTeOHw7QkIE5CfMrMtSjpBE+y3wO6iwQcieW9I0l
         1IYA==
X-Forwarded-Encrypted: i=1; AHgh+RqAwokpLdIBsSBvSnoVANmbua5oib1ILpwxV4hAsphvsiTjGfz3fmiTadHcQdG4c/v2dhfA81Q58Iw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCmJyEcsRgCgX184nKLskVGoElKDVhHlSZH79KnbW39nqjlocp
	oTgvyufDYO88tOuujcGzZuaufQIm6IfrJIwLwRr7+XAbubcGv3Yy702WrzYg2pwS2UURaWFp4dJ
	+JIXgO71mUqAZdlKrfZPF4osQvfteKso=
X-Gm-Gg: AR+sD10sGznJjI0qOnA6LX1e7oWq99VoeS9wyPYDLm3PTX+RdzLJUPi8S5NRq9NDZRi
	RFaJSbyHIATnNZtZxQV5/W+oMsy2GGdjSyrS2aYkIdumwiNsjCMy2bJWqkY2wZTnQkNAG0HRHtu
	S4Wsb1wn22ek3TBl4MmTnEOflYPNgQuHD6QjrEjs1dQ6eXyvOLTxmm3W9NIxLj2UHcKTm2UyLLh
	9CI3ACMPp7fXIKkZ5cKO88V+NY4aGX11wRAk5R5Oa5K6jUAjXQlEPa85fs7AAesb8tBVax7ovgO
	7pzW1ln2PbWA9+3vA2DkRilhJKfwzfYk8xmIwGRaOvdNKMIUEffCYIJqNaNmvU55ohaTOSmtp5d
	5NywY5O+WjmlHSjRy9Q3lew4PJISMQcjkoplmkwQyp5A=
X-Received: by 2002:a05:6402:1cc4:b0:6a0:d411:930d with SMTP id
 4fb4d7f45d1cf-6a14f25ab6cmr9290589a12.2.1786249341897; Sat, 08 Aug 2026
 21:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729053408.13715-1-bogdan.nicolae@gmail.com>
 <20260802083905.3819981-8-arend.vanspriel@broadcom.com> <CA+ORkNSS1dOdUK51B0Q1r2Htc5NpP-=EmE4FO6=4rX5CUU_FpA@mail.gmail.com>
 <19fdfd09e38.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <19fdfd09e38.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Date: Sat, 8 Aug 2026 23:18:26 -0500
X-Gm-Features: AUfX_mxZwkkOwQUmElQobA1zbDI4ckmvogv5u3DPXO_DUibGSTN7XT2bldDzmCQ
Message-ID: <CA+ORkNQXRKVzi1NN9+YmsQ26dQNNMMu=uBZQ7msQTDG_CtUP3w@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: configure SAE PWE method for external SAE AP
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, 
	Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 12:20=E2=80=AFAM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> Op 8 augustus 2026 02:00:22 schreef Bogdan Nicolae <bogdan.nicolae@gmail.=
com>:
>
> > Gokul (representing Infineon) promised he would send a patch a while ba=
ck.
> > This would be a preferred solution as it comes directly from the vendor=
.
> > But it also takes time. I can send a revised patch next week.
>
> Yeah. With Johannes being on vacation I say we can give Infineon bit more
> time to provide their patch.

Sounds good, Arend. Gokul, I'm available to test/collaborate, just let me k=
now.

Best,
Bogdan
